
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  prefix              = "${var.prefix}-sea"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  secrets_file_content = file("${path.module}/secrets.yaml")
  object_id = data.azurerm_client_config.current.object_id
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  prefix              = var.prefix
}



output "key_vault_uri" {
  value = module.keyvault.key_vault_uri
}