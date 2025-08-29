# variables.tf

variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "Resources location in Azure"
}

variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
}
variable "keyvaultname" {
  type        = string
  description = "Key vault name in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "workload_identity_namespace" {
  type        = string
  description = "Kubernetes namespace for workload identity service account"
  default     = "default"
}

variable "workload_identity_service_account" {
  type        = string
  description = "Kubernetes service account name for workload identity"
  default     = "workload-identity-sa"
}

variable "environment" {
  type        = string
  description = "Environment name (dev, staging, prod)"
  default     = "dev"
}