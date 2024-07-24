# outputs.tf para el módulo storage_blob

output "storage_container_id" {
  description = "The ID of the storage container."
  value       = azurerm_storage_container.container.id
}

output "storage_container_name" {
  description = "The name of the storage container."
  value       = azurerm_storage_container.container.name
}

output "storage_blob_id" {
  description = "The ID of the storage blob."
  value       = azurerm_storage_blob.blob_storage.id
}

output "storage_blob_name" {
  description = "The name of the storage blob."
  value       = azurerm_storage_blob.blob_storage.name
}

output "storage_blob_url" {
  description = "The URL of the blob."
  value       = azurerm_storage_blob.blob_storage.url
}

output "storage_blob_type" {
  description = "The type of the storage blob."
  value       = azurerm_storage_blob.blob_storage.type
}

output "storage_blob_content_type" {
  description = "The content type of the storage blob."
  value       = azurerm_storage_blob.blob_storage.content_type
}
