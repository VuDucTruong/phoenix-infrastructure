terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }

  required_version = ">= 1.4.0"
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_deleted_secrets_on_destroy = true
    }
  }
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id = var.client_id
  client_secret = var.client_secret
}

data "azurerm_client_config" "current" {}
