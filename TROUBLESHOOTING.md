# ArgoCD Environment Variable Substitution Troubleshooting Guide

## 🚨 Current Issue: Variables Not Being Substituted

### Symptoms
```
Failed to mount secrets store objects for pod: 
error: failed to get vault: Invalid vault name: "${KEYVAULT_NAME}"
```

### Root Cause Analysis

The issue occurs when ArgoCD is not properly performing environment variable substitution in manifests. The `${VARIABLE_NAME}` placeholders are not being replaced with actual values.

---

## 🔍 Debugging Steps

### Step 1: Verify Terraform Outputs
```bash
# In the terraform job, check if outputs are correct
terraform output
terraform output -raw azure_tenant_id
terraform output -raw azure_client_id  
terraform output -raw keyvault_name
```

**Expected Output:**
```
azure_tenant_id = "12345678-1234-1234-1234-123456789abc"
azure_client_id = "87654321-4321-4321-4321-cba987654321"
keyvault_name = "kv-aks-data-pipeline"
```

### Step 2: Verify GitHub Actions Job Outputs
```bash
# In the ArgoCD setup job, check variable values
echo "AZURE_CLIENT_ID: $AZURE_CLIENT_ID"
echo "AZURE_TENANT_ID: $AZURE_TENANT_ID"  
echo "KEYVAULT_NAME: $KEYVAULT_NAME"
```

**Common Issues:**
- ❌ `AZURE_TENANT_ID` is empty
- ❌ Variables contain unexpected values
- ❌ Variables are not being passed between jobs

### Step 3: Verify ConfigMap Creation
```bash
# Check if ConfigMap has correct values
kubectl get configmap argocd-env -n argocd -o yaml
```

**Expected ConfigMap:**
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-env
  namespace: argocd
data:
  AZURE_CLIENT_ID: "87654321-4321-4321-4321-cba987654321"
  AZURE_TENANT_ID: "12345678-1234-1234-1234-123456789abc"
  KEYVAULT_NAME: "kv-aks-data-pipeline"
```

### Step 4: Verify Environment Variables in ArgoCD Repo-Server
```bash
# Check if variables are injected into repo-server pods
kubectl exec -n argocd deployment/argocd-repo-server -- env | grep -E "AZURE_CLIENT_ID|AZURE_TENANT_ID|KEYVAULT_NAME"
```

**Expected Output:**
```
AZURE_CLIENT_ID=87654321-4321-4321-4321-cba987654321
AZURE_TENANT_ID=12345678-1234-1234-1234-123456789abc
KEYVAULT_NAME=kv-aks-data-pipeline
```

### Step 5: Verify ArgoCD Configuration
```bash
# Check if ArgoCD is configured for variable substitution
kubectl get configmap argocd-cm -n argocd -o yaml
```

**Required Configuration:**
```yaml
data:
  application.instanceLabelKey: argocd.argoproj.io/instance
```

---

## 🔧 Common Solutions

### Solution 1: Fix Empty AZURE_TENANT_ID

**Problem:** Terraform output for `azure_tenant_id` is empty

**Solution:** Add fallback mechanism
```bash
# In pipeline, add fallback
if [[ -z "$AZURE_TENANT_ID" ]]; then
  AZURE_TENANT_ID=$(az account show --query tenantId --output tsv)
fi
```

### Solution 2: Force ArgoCD Repo-Server Restart

**Problem:** Environment variables not loaded in running pods

**Solution:** Force restart after injecting variables
```bash
kubectl set env deployment/argocd-repo-server -n argocd --from=configmap/argocd-env
kubectl rollout restart deployment/argocd-repo-server -n argocd
kubectl rollout status deployment/argocd-repo-server -n argocd --timeout=300s
```

### Solution 3: Enable ArgoCD Environment Variable Substitution

**Problem:** ArgoCD not configured for variable substitution

**Solution:** Patch ArgoCD ConfigMap
```bash
kubectl patch configmap argocd-cm -n argocd --type merge -p='
{
  "data": {
    "application.instanceLabelKey": "argocd.argoproj.io/instance"
  }
}'
```

### Solution 4: Verify Variable Syntax in Manifests

**Problem:** Incorrect variable syntax in manifests

**Correct Syntax:**
```yaml
apiVersion: secrets-store.csi.x-k8s.io/v1
kind: SecretProviderClass
spec:
  provider: azure
  parameters:
    clientID: "${AZURE_CLIENT_ID}"      # ✅ Correct
    tenantId: "${AZURE_TENANT_ID}"      # ✅ Correct  
    keyvaultName: "${KEYVAULT_NAME}"    # ✅ Correct
```

**Incorrect Syntax:**
```yaml
parameters:
  clientID: "$AZURE_CLIENT_ID"          # ❌ Missing braces
  tenantId: "$(AZURE_TENANT_ID)"        # ❌ Wrong syntax
  keyvaultName: "{KEYVAULT_NAME}"       # ❌ Missing $
```

---

## 🚀 Enhanced Pipeline Configuration

### Updated Pipeline Steps
```yaml
- name: Configure ArgoCD
  run: |
    # Get and validate variables
    AZURE_CLIENT_ID="${{ needs.terraform.outputs.azure_client_id }}"
    AZURE_TENANT_ID="${{ needs.terraform.outputs.azure_tenant_id }}"
    KEYVAULT_NAME="${{ needs.terraform.outputs.keyvault_name }}"
    
    # Debug output
    echo "AZURE_CLIENT_ID: $AZURE_CLIENT_ID"
    echo "AZURE_TENANT_ID: $AZURE_TENANT_ID"  
    echo "KEYVAULT_NAME: $KEYVAULT_NAME"
    
    # Fallback for empty tenant ID
    if [[ -z "$AZURE_TENANT_ID" ]]; then
      AZURE_TENANT_ID=$(az account show --query tenantId --output tsv)
    fi
    
    # Create ConfigMap
    kubectl create configmap argocd-env -n argocd \
      --from-literal=AZURE_CLIENT_ID="$AZURE_CLIENT_ID" \
      --from-literal=AZURE_TENANT_ID="$AZURE_TENANT_ID" \
      --from-literal=KEYVAULT_NAME="$KEYVAULT_NAME" \
      --dry-run=client -o yaml | kubectl apply -f -
    
    # Enable variable substitution
    kubectl patch configmap argocd-cm -n argocd --type merge -p='
    {
      "data": {
        "application.instanceLabelKey": "argocd.argoproj.io/instance"
      }
    }'
    
    # Inject and restart
    kubectl set env deployment/argocd-repo-server -n argocd --from=configmap/argocd-env
    kubectl rollout restart deployment/argocd-repo-server -n argocd
    kubectl rollout status deployment/argocd-repo-server -n argocd --timeout=300s
    
    # Verify
    kubectl exec -n argocd deployment/argocd-repo-server -- env | grep -E "AZURE_CLIENT_ID|AZURE_TENANT_ID|KEYVAULT_NAME"
```

---

## 🔍 ArgoCD Logs for Debugging

### Check ArgoCD Application Controller Logs
```bash
kubectl logs -n argocd deployment/argocd-application-controller
```

### Check ArgoCD Repo Server Logs
```bash
kubectl logs -n argocd deployment/argocd-repo-server
```

### Check ArgoCD Server Logs
```bash
kubectl logs -n argocd deployment/argocd-server
```

**Look for:**
- Variable substitution errors
- Template processing errors
- Connection errors to Key Vault

---

## 📋 Manual Verification Commands

### Verify Application Status in ArgoCD
```bash
# Get application status
kubectl get applications -n argocd

# Describe specific application
kubectl describe application joget -n argocd

# Get application details
kubectl get application joget -n argocd -o yaml
```

### Verify SecretProviderClass
```bash
# Check if SecretProviderClass has correct values
kubectl get secretproviderclass -n joget joget-secrets -o yaml

# Should show resolved values, not ${VARIABLE_NAME}
```

### Verify Pod Events
```bash
# Check pod events for mount errors
kubectl describe pod <failing-pod-name> -n <namespace>

# Look for events related to secret mounting
kubectl get events -n <namespace> --sort-by='.lastTimestamp'
```

---

## ✅ Success Indicators

### Pipeline Success
- ✅ Terraform outputs all variables correctly
- ✅ ConfigMap created with actual values (not placeholders)
- ✅ Repo-server restarted successfully
- ✅ Environment variables visible in repo-server pods

### ArgoCD Success  
- ✅ Applications sync successfully
- ✅ No variable substitution errors in logs
- ✅ SecretProviderClass shows resolved values
- ✅ Pods mount secrets successfully

### Application Success
- ✅ All applications show "Healthy" status
- ✅ Pods are running without mount errors
- ✅ Services are accessible

---

## 📞 Quick Fix Commands

### Emergency Reset
```bash
# Delete and recreate ConfigMap
kubectl delete configmap argocd-env -n argocd
kubectl create configmap argocd-env -n argocd \
  --from-literal=AZURE_CLIENT_ID="<your-client-id>" \
  --from-literal=AZURE_TENANT_ID="<your-tenant-id>" \
  --from-literal=KEYVAULT_NAME="<your-keyvault-name>"

# Force restart repo-server
kubectl rollout restart deployment/argocd-repo-server -n argocd

# Sync applications
kubectl patch app <app-name> -n argocd --type merge -p='{"spec":{"syncPolicy":{"automated":null}}}'
kubectl patch app <app-name> -n argocd --type merge -p='{"spec":{"syncPolicy":{"automated":{"prune":true,"selfHeal":true}}}}'
```

---

## 🔄 Alternative Approach: Direct Value Injection

If environment variable substitution continues to fail, consider this alternative:

### Option 1: Use sed to replace variables in pipeline
```bash
# In pipeline, directly replace variables in manifest files before applying
find manifests/ -name "*.yaml" -exec sed -i "s/\${AZURE_CLIENT_ID}/$AZURE_CLIENT_ID/g" {} \;
find manifests/ -name "*.yaml" -exec sed -i "s/\${AZURE_TENANT_ID}/$AZURE_TENANT_ID/g" {} \;
find manifests/ -name "*.yaml" -exec sed -i "s/\${KEYVAULT_NAME}/$KEYVAULT_NAME/g" {} \;
```

### Option 2: Use Helm with explicit values
```yaml
# Convert to Helm chart and use values.yaml
azure:
  clientId: "${AZURE_CLIENT_ID}"
  tenantId: "${AZURE_TENANT_ID}"
  keyVaultName: "${KEYVAULT_NAME}"
```

---

**Last Updated:** August 30, 2025  
**Status:** Enhanced debugging and fallback mechanisms added
