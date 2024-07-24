resource "azurerm_storage_account_network_rules" "stnetrules" {
  storage_account_id = var.storage_account_id
  default_action = var.default_action
  virtual_network_subnet_ids = [var.subnet_stac_id] 
  bypass = [var.bypass]
}