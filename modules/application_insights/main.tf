resource "azurerm_application_insights" "appinsight" {
  name                = var.appinsight_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  application_type    = var.application_type
}
