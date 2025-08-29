# outputs.tf

output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}

output "oidc_issuer_url" {
  value = azurerm_kubernetes_cluster.aks.oidc_issuer_url
}

output "keyvault_name" {
  value = azurerm_key_vault.aks_keyvault.name
}

output "keyvault_id" {
  value = azurerm_key_vault.aks_keyvault.id
}

output "user_assigned_identity_client_id" {
  value = azurerm_user_assigned_identity.keyvault_identity.client_id
}

output "user_assigned_identity_principal_id" {
  value = azurerm_user_assigned_identity.keyvault_identity.principal_id
}

# Required outputs for GitHub Actions pipeline
output "cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.aks_rg.name
}

output "azure_client_id" {
  description = "The client ID of the user assigned identity for workload identity"
  value       = azurerm_user_assigned_identity.keyvault_identity.client_id
}

output "azure_tenant_id" {
  description = "The Azure tenant ID"
  value       = data.azurerm_client_config.current.tenant_id
}

# Additional useful outputs
output "subscription_id" {
  description = "The Azure subscription ID"
  value       = data.azurerm_client_config.current.subscription_id
}

output "keyvault_uri" {
  description = "The URI of the Key Vault"
  value       = azurerm_key_vault.aks_keyvault.vault_uri
}