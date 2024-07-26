resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  managed_virtual_network_enabled = var.managed_virtual_network_enabled
  public_network_enabled = var.public_network_enabled

  identity {
    type = var.identity_type
  }
}
