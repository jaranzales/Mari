resource "azurerm_search_service" "search" {
  name                = var.search_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.search_sku
  public_network_access_enabled = var.public_network_access_enabled
}
