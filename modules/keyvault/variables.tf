variable "location" {}
variable "resource_group_name" {}
variable "prefix" {}
variable "tenant_id" {}
variable "object_id" {}
variable "initial_secrets" {
  description = "Map of initial secrets to be stored in Azure Key Vault"
  type        = map(string)
}

