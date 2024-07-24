resource "azurerm_bot_service_azure_bot" "bot" {
  name                = var.bot_name
  resource_group_name = var.resource_group_name
  location            = var.location
  microsoft_app_id    = var.microsoft_app_id
  sku                 = var.bot_sku
  public_network_access_enabled = var.public_network_access_enabled
}