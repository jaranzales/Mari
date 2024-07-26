resource "azurerm_linux_web_app" "wapp_lnx" {
  name                = var.wapp_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  service_plan_id     = var.service_plan_id
  public_network_access_enabled = var.public_network_access_enabled
  https_only = var.https_only
  site_config {
    application_stack {
      node_version = var.application_stack.node_version
      python_version = var.application_stack.python_version
    }

  }
}