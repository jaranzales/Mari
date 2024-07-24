resource "azurerm_application_insights_api_key" "appinsight_api_key" {
  name                    = var.api_key_name
  application_insights_id = var.application_insights_id
  read_permissions        = var.read_permissions
}
