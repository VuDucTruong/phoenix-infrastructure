variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "prefix" {
  description = "Naming prefix for all resources"
  type        = string
}
variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
  description = "Client ID for the Azure service principal"
}

variable "client_secret" {
  type = string
  description = "Client secret for the Azure service principal"
}

variable "vm_size" {
  description = "Size of the virtual machines in the AKS cluster"
  type        = string
}


variable "secrets" {
  description = "Map of secrets to be used in the AKS cluster"
  type        = map(string)
}