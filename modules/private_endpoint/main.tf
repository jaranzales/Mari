resource "azurerm_private_endpoint" "pe" {
  name                = var.private_endpoint_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names              = var.subresource_names
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = var.resource_group_name_dns
    private_dns_zone_ids = var.private_dns_zone_ids 
  }
}