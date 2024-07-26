output "admin_username" {
  value     = data.azurerm_key_vault_secret.admin_username.value
  sensitive = true
}

output "admin_password" {
  value     = data.azurerm_key_vault_secret.admin_password.value
  sensitive = true
}