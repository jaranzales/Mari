resource "azurerm_mssql_database" "sqldb" {
  name                = var.database_name
  server_id           = var.server_id
  sku_name            = var.sku_name 
  max_size_gb         = var.max_size_gb 
}


