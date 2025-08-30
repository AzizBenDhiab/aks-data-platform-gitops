# main.tf

# Get current Azure client configuration
data "azurerm_client_config" "current" {}

# Random string for unique Key Vault name
resource "random_string" "keyvault_suffix" {
  length  = 6
  special = false
  upper   = false
  lower   = true
  numeric = true
}

# Resource Group
resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = "dev"
    owner       = "mohamedaziz_bendhiab"
    project     = "aks-data-multi-env"
  }
}

# AKS Cluster with Key Vault CSI Driver and Workload Identity
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.cluster_name

  lifecycle {
    prevent_destroy = true
  }

  default_node_pool {
    name                 = "system"
    node_count           = var.system_node_count
    vm_size              = "Standard_D4as_v6"
    type                 = "VirtualMachineScaleSets"
    auto_scaling_enabled = true
    zones                = [1, 2, 3]
    min_count            = 2
    max_count            = 4
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "azure"
  }

  # Enable OIDC issuer and workload identity
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  # Enable Key Vault Secrets Store CSI Driver
  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "2m"
  }

  tags = {
    environment = "dev"
    owner       = "mohamedaziz_bendhiab"
    project     = "aks-data-multi-env"
  }
}

# User Assigned Managed Identity for Key Vault access
resource "azurerm_user_assigned_identity" "keyvault_identity" {
  name                = "${var.cluster_name}-keyvault-identity"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  tags = {
    environment = "dev"
    owner       = "mohamedaziz_bendhiab"
    project     = "aks-data-multi-env"
  }
}

# Key Vault for storing secrets
resource "azurerm_key_vault" "aks_keyvault" {
  name                       = "${var.keyvaultname}"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.aks_rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = true
  enable_rbac_authorization  = true

  tags = {
    environment = "dev"
    owner       = "mohamedaziz_bendhiab"
    project     = "aks-data-multi-env"
  }
}

# Role assignment for the managed identity to access Key Vault secrets
resource "azurerm_role_assignment" "keyvault_secrets_user" {
  scope                = azurerm_key_vault.aks_keyvault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_user_assigned_identity.keyvault_identity.principal_id
}

# Role assignment for current user to manage Key Vault secrets (for initial setup)
resource "azurerm_role_assignment" "keyvault_secrets_officer" {
  scope                = azurerm_key_vault.aks_keyvault.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}

# Federated identity credentials for all applications
resource "azurerm_federated_identity_credential" "postgresql_federated_credential" {
  name                = "${var.cluster_name}-postgresql-federated-credential"
  resource_group_name = azurerm_resource_group.aks_rg.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azurerm_kubernetes_cluster.aks.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.keyvault_identity.id
  subject             = "system:serviceaccount:joget:postgresql-workload-identity"
}

resource "azurerm_federated_identity_credential" "joget_federated_credential" {
  name                = "${var.cluster_name}-joget-federated-credential"
  resource_group_name = azurerm_resource_group.aks_rg.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azurerm_kubernetes_cluster.aks.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.keyvault_identity.id
  subject             = "system:serviceaccount:joget:joget-workload-identity"
}

resource "azurerm_federated_identity_credential" "superset_federated_credential" {
  name                = "${var.cluster_name}-superset-federated-credential"
  resource_group_name = azurerm_resource_group.aks_rg.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azurerm_kubernetes_cluster.aks.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.keyvault_identity.id
  subject             = "system:serviceaccount:superset:superset-workload-identity"
}

resource "azurerm_federated_identity_credential" "nifi_federated_credential" {
  name                = "${var.cluster_name}-nifi-federated-credential"
  resource_group_name = azurerm_resource_group.aks_rg.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azurerm_kubernetes_cluster.aks.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.keyvault_identity.id
  subject             = "system:serviceaccount:nifi-prod:nifi-workload-identity"
}

resource "azurerm_federated_identity_credential" "kobotoolbox_federated_credential" {
  name                = "${var.cluster_name}-kobotoolbox-federated-credential"
  resource_group_name = azurerm_resource_group.aks_rg.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azurerm_kubernetes_cluster.aks.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.keyvault_identity.id
  subject             = "system:serviceaccount:kobotoolbox:kobotoolbox-workload-identity"
}

resource "azurerm_federated_identity_credential" "monitoring_federated_credential" {
  name                = "${var.cluster_name}-monitoring-federated-credential"
  resource_group_name = azurerm_resource_group.aks_rg.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azurerm_kubernetes_cluster.aks.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.keyvault_identity.id
  subject             = "system:serviceaccount:monitoring:monitoring-workload-identity"
}

