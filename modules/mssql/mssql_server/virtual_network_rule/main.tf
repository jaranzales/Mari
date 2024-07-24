resource "azurerm_mssql_virtual_network_rule" "sqlserver_vnet_rule" {
  name      = var.name
  server_id = var.server_id
  subnet_id = var.subnet_id
}