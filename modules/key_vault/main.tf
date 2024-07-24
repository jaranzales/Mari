resource "azurerm_key_vault" "kv" {
  name                = var.name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = var.sku_name

  network_acls {
    default_action = var.network_acls_default_action
    bypass                     = var.network_acls_bypass
    virtual_network_subnet_ids = [var.network_acls_vn_subnet_id]
  }
}