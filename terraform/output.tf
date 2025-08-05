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