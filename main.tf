
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  prefix              = "${var.prefix}"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  secrets_file_content = file("${path.module}/secrets.yaml")
  object_id = data.azurerm_client_config.current.object_id
  grafana_email_password = var.grafana_email_password
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  prefix              = var.prefix
  vm_size = var.vm_size
}