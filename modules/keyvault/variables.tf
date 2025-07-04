variable "location" {}
variable "resource_group_name" {}
variable "prefix" {}
variable "tenant_id" {}
variable "object_id" {}
variable "secrets_file_content" {
  type = string
}
variable "grafana_email_password" {
  type        = string
  description = "Password for Grafana email"
  
}

