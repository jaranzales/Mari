resource "azurerm_storage_container" "container" {
  name                  = var.storage_container_name
  storage_account_name  = var.storage_account_name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "blob_storage" {
  name                   = var.storage_blob_name
  storage_account_name   = var.storage_account_name
  storage_container_name = azurerm_storage_container.container.name
  type                   = var.blob_storage_type
  depends_on = [ azurerm_storage_container.container ]
}