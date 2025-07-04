resource "azurerm_key_vault" "kv" {
  name                        = "${var.prefix}-kv"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled = false
}

resource "azurerm_key_vault_access_policy" "user" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = var.tenant_id
  object_id    = var.object_id

  secret_permissions = ["Get", "Set", "List", "Delete", "Recover", "Purge"]
}

resource "azurerm_key_vault_secret" "secrets_file" {
  name         = "secrets-file"
  value        = var.secrets_file_content
  key_vault_id = azurerm_key_vault.kv.id


  depends_on = [
    azurerm_key_vault_access_policy.user,
  ]

  lifecycle {
    ignore_changes = [ 
      not_before_date,
      expiration_date
     ]
  }

}


resource "azurerm_key_vault_secret" "grafana_email_password" {
  name         = "grafana-email-password"
  value        = var.grafana_email_password
  key_vault_id = azurerm_key_vault.kv.id


  depends_on = [
    azurerm_key_vault_access_policy.user,
  ]

  lifecycle {
    ignore_changes = [ 
      not_before_date,
      expiration_date
     ]
  }

}
