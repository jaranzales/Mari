output "storage_account_id" {
  description = "The ID of the storage account."
  value       = azurerm_storage_account.stac.id
}

output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.stac.name
}

output "primary_blob_endpoint" {
  description = "The endpoint URL for blob storage in the primary location."
  value       = azurerm_storage_account.stac.primary_blob_endpoint
}

output "primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.stac.primary_access_key
  sensitive   = true
}

output "storage_account_location" {
  description = "The location of the storage account."
  value       = azurerm_storage_account.stac.location
}

output "storage_account_resource_group_name" {
  description = "The name of the resource group in which the storage account is created."
  value       = azurerm_storage_account.stac.resource_group_name
}

output "storage_account_primary_connection_string" {
  description = "The primary connection string for the storage account."
  value       = azurerm_storage_account.stac.primary_connection_string
  sensitive   = true
}

output "storage_account_tags" {
  description = "The tags assigned to the storage account."
  value       = azurerm_storage_account.stac.tags
}