#SUBNETS

output "vnet_sc_id" { 
  description = "vNet Id"
  value       = data.azurerm_virtual_network.vnet.id
}

output "subnet_wapp_id" {
  description = "Web App - Subnet ID"
  value       = data.azurerm_subnet.sbnet_wapp.id
}

output "subnet_stac_id" {
  description = "Storage Account - Subnet ID"
  value       = data.azurerm_subnet.sbnet_stac.id
}

output "subnet_ai_id" {
  description = "AI Services - Subnet ID"
  value       = data.azurerm_subnet.sbnet_ai.id
}

output "subnet_db_id" {
  description = "Database - Subnet ID"
  value       = data.azurerm_subnet.sbnet_db.id
}

output "subnet_kv_id" {
  description = "Key Vault - Subnet ID"
  value       = data.azurerm_subnet.sbnet_kv.id
}

#DNS PRIVATE ZONES

output "private_dns_zone_wapp_id" {
  description = "Id for wapp subnet"
  value       = data.azurerm_private_dns_zone.dns_wapp.id
}

output "private_dns_zone_stac_blob_id" {
  description = "Id for stac blob subnet"
  value       = data.azurerm_private_dns_zone.dns_stac_blob.id
}

output "private_dns_zone_db_id" {
  description = "Id for db subnet"
  value       = data.azurerm_private_dns_zone.dns_db.id
}

output "private_dns_zone_kv_id" {
  description = "Id for kv subnet"
  value       = data.azurerm_private_dns_zone.dns_kv.id
}

output "private_dns_zone_mlw_notebooks_id" {
  description = "Id for mlw subnet"
  value       = data.azurerm_private_dns_zone.dns_mlw_notebooks.id
}

output "private_dns_zone_mlw_api_id" {
  description = "Id for mlw subnet"
  value       = data.azurerm_private_dns_zone.dns_mlw_api.id
}

output "private_dns_zone_srch_id" {
  description = "Id for srch subnet"
  value       = data.azurerm_private_dns_zone.dns_srch.id
}

output "private_dns_zone_bot_id" {
  description = "Id for bot subnet"
  value       = data.azurerm_private_dns_zone.dns_bot.id
}

output "private_dns_zone_bot_token_id" {
  description = "Id for bot subnet"
  value       = data.azurerm_private_dns_zone.dns_bot_token.id
}

output "private_dns_zone_di_id" {
  description = "Id for di subnet"
  value       = data.azurerm_private_dns_zone.dns_di.id
}

output "private_dns_zone_aisa_id" {
  description = "Id for ai subnet"
  value       = data.azurerm_private_dns_zone.dns_aisa.id
}

output "private_dns_zone_oai_id" {
  description = "Id for ai subnet"
  value       = data.azurerm_private_dns_zone.dns_oai.id
}