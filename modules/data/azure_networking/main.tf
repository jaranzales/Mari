#VIRTUAL NETWORK

data "azurerm_resource_group" "rg_networking" {
  name = var.resource_group_name_networking
}

#SUBNETS

data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.rg_networking.name
}

data "azurerm_subnet" "sbnet_wapp" {
  name                 = var.sbnet_wapp_name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  depends_on = [
    data.azurerm_virtual_network.vnet
  ]
}

data "azurerm_subnet" "sbnet_stac" {
  name                 = var.sbnet_stac_name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  depends_on = [
    data.azurerm_virtual_network.vnet
  ]
}

data "azurerm_subnet" "sbnet_ai" {
  name                 = var.sbnet_ai_name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  depends_on = [
    data.azurerm_virtual_network.vnet
  ]
}

data "azurerm_subnet" "sbnet_db" {
  name                 = var.sbnet_db_name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  depends_on = [
    data.azurerm_virtual_network.vnet
  ]
}

data "azurerm_subnet" "sbnet_kv" {
  name                 = var.sbnet_kv_name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  depends_on = [
    data.azurerm_virtual_network.vnet
  ]
}

#DNS PRIVATE ZONES

data "azurerm_private_dns_zone" "dns_wapp" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_wapp  
  resource_group_name = var.resource_group_name_dns 
}

data "azurerm_private_dns_zone" "dns_db" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_db
  resource_group_name = var.resource_group_name_dns
}

data "azurerm_private_dns_zone" "dns_kv" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_kv
  resource_group_name = var.resource_group_name_dns
}

data "azurerm_private_dns_zone" "dns_stac_blob" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_stac_blob
  resource_group_name = var.resource_group_name_dns
}

data "azurerm_private_dns_zone" "dns_mlw_notebooks" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_mlw_notebooks
  resource_group_name = var.resource_group_name_dns
}

data "azurerm_private_dns_zone" "dns_mlw_api" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_mlw_api
  resource_group_name = var.resource_group_name_dns
}

data "azurerm_private_dns_zone" "dns_srch" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_srch
  resource_group_name = var.resource_group_name_dns
}

data "azurerm_private_dns_zone" "dns_di" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_di
  resource_group_name = var.resource_group_name_dns
}

data "azurerm_private_dns_zone" "dns_bot" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_bot
  resource_group_name = var.resource_group_name_dns
}

data "azurerm_private_dns_zone" "dns_bot_token" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_bot_token
  resource_group_name = var.resource_group_name_dns
}

data "azurerm_private_dns_zone" "dns_aisa" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_aisa
  resource_group_name = var.resource_group_name_dns
}

data "azurerm_private_dns_zone" "dns_oai" {
  provider            = azurerm.subscription-trv
  name                = var.private_dns_zone_name_oai
  resource_group_name = var.resource_group_name_dns
}
