resource "azurerm_cognitive_account" "ca" {
  name                  = var.services_account_name
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  kind                  = var.kind
  sku_name              = var.sku_name
  custom_subdomain_name = var.custom_subdomain_name
  public_network_access_enabled = var.public_network_access_enabled
}
