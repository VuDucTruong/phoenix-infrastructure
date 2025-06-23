

// Resource
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_public_ip" "ingress_ip" {
  name                = "ingress-nginx-ip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

// Modules
module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  prefix              = "${var.prefix}-sea"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  secrets_file_content = file("${path.module}/secrets.yaml")
  object_id = data.azurerm_client_config.current.object_id
}

module "network" {
  source              = "./modules/network"
  vnet_name           = "${var.prefix}-vnet"
  subnet_name         = "${var.prefix}-subnet"
  nsg_name            = "${var.prefix}-nsg"
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24"]
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

module "aks" {
  source              = "./modules/aks"
  cluster_name        = "${var.prefix}-aks"
  prefix              = var.prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = module.network.subnet_id

  depends_on = [ module.network ]
}


