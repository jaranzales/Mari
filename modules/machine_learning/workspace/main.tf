resource "azurerm_machine_learning_workspace" "mlw" {
  name                    = var.name
  resource_group_name     = var.resource_group_name
  location                = var.resource_group_location
  application_insights_id = var.application_insights_id
  key_vault_id            = var.key_vault_id
  storage_account_id      = var.storage_account_id
  public_network_access_enabled = var.public_network_access_enabled

  identity {
    type = var.identity_type
  }
}