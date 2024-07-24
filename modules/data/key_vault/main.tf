#KEY VAULT SECRETS

data "azurerm_key_vault" "kv_terraform" {
  name                = var.kv_terraform_name
  resource_group_name = var.rg_kv_terraform_name
}

data "azurerm_key_vault_secret" "admin_username" {
  name         = var.kv_secret_sql_admin_user
  key_vault_id = data.azurerm_key_vault.kv_terraform.id
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = var.kv_secret_sql_admin_password
  key_vault_id = data.azurerm_key_vault.kv_terraform.id
}

