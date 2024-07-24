module "resource_group" {
    source = "./modules/resource_groups"
    resource_group_name = var.resource_group_name
    resource_group_location = var.resource_group_location
    tags = var.resource_group_tags
}

# ========================= VIRTUAL NETWORK MODULE ===================
module "azure_networking" {
  source              = "./modules/data/azure_networking"
  resource_group_name_networking = var.resource_group_name_networking
  virtual_network_name  = var.virtual_network_name
  sbnet_wapp_name = var.sbnet_wapp_name
  sbnet_stac_name = var.sbnet_stac_name
  sbnet_ai_name = var.sbnet_ai_name
  sbnet_db_name = var.sbnet_db_name
  sbnet_kv_name = var.sbnet_kv_name
  
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_name_wapp = var.private_dns_zone_name_wapp
  private_dns_zone_name_db = var.private_dns_zone_name_db
  private_dns_zone_name_kv = var.private_dns_zone_name_kv
  private_dns_zone_name_stac_blob = var.private_dns_zone_name_stac_blob
  private_dns_zone_name_mlw_notebooks = var.private_dns_zone_name_mlw_notebooks
  private_dns_zone_name_mlw_api = var.private_dns_zone_name_mlw_api
  private_dns_zone_name_srch = var.private_dns_zone_name_srch
  private_dns_zone_name_di = var.private_dns_zone_name_di
  private_dns_zone_name_bot = var.private_dns_zone_name_bot
  private_dns_zone_name_bot_token = var.private_dns_zone_name_bot_token
  private_dns_zone_name_aisa = var.private_dns_zone_name_aisa
  private_dns_zone_name_oai = var.private_dns_zone_name_oai
}

# ========================= DATA FACTORY MODULE ===================

module "data_factory" {
  source = "./modules/data_factory"
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  data_factory_name = var.data_factory_name
  managed_virtual_network_enabled = var.managed_virtual_network_enabled
}

# ======================= APP SERVICE =================================

module "service_plan" {
  source = "./modules/service_plan"
  service_plan_name = var.app_service_plan_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  os_type = var.app_service_os_type
  sku_name = var.app_service_plan_sku
}

module "web_app_linux_python_000" {
  source = "./modules/web_app"
  wapp_name = var.wapp_name_000
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  service_plan_id = module.service_plan.id
  public_network_access_enabled = var.wapp_public_network_access_enabled_000
  https_only = var.wapp_https_only_000
  application_stack = var.wapp_application_stack_000
}

module "private_endpoint_linux_python_000" {
  source = "./modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_wapp_name_000
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_wapp_id
  private_service_connection_name = var.private_service_connection_wapp_name_000
  private_connection_resource_id = module.web_app_linux_python_000.id
  subresource_names = var.subresource_wapp_names_000
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [ module.azure_networking.private_dns_zone_wapp_id ]
}

module "web_app_linux_node_001" {
  source = "./modules/web_app"
  wapp_name = var.wapp_name_001
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  service_plan_id = module.service_plan.app_service_plan_id
  public_network_access_enabled = var.wapp_public_network_access_enabled_001
  https_only = var.wapp_https_only_001
  application_stack = var.wapp_application_stack_001
}

module "private_endpoint_linux_node_001" {
  source = "./modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_wapp_name_001
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_wapp_id
  private_service_connection_name = var.private_service_connection_wapp_name_001
  private_connection_resource_id = module.web_app_linux_node_001.id
  subresource_names = var.subresource_wapp_names_001
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [ module.azure_networking.private_dns_zone_wapp_id ]
}

# =========================== STORAGE ACCOUNT ==========================

module "azure_stac" {
  source = "./modules/storage_accounts"
  storage_account_name = var.stac_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  account_tier = var.stac_tier
  account_replication_type = var.stac_replication_type
  tags_environment = var.tags_environment_stac
}

module "stac_network_rules" {
  source = "./modules/storage_accounts/network_rules"
  storage_account_id = module.azure_stac.storage_account_id
  default_action = var.default_action
  subnet_stac_id = module.azure_networking.subnet_stac_id
  bypass = var.stac_bypass
}

module "private_endpoint_stac" {
  source = "./modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_stac_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.sbnet_stac_id
  private_service_connection_name = var.private_service_connection_stac_name
  private_connection_resource_id = module.azure_stac.storage_account_id
  subresource_names = var.subresource_names_stac
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [ module.azure_networking.private_dns_zone_stac_blob_id ]
}

# ====================== SQL SERVER ====================================

module "mssql_key_vault" {
  source = "./modules/data/key_vault"
  kv_terraform_name = var.kv_terraform_name
  rg_kv_terraform_name = var.rg_kv_terraform_name
  kv_secret_sql_admin_user = var.kv_secret_sql_admin_user
  kv_secret_sql_admin_password = var.kv_secret_sql_admin_password
}


module "mssql_server" {
  source = "./modules/mssql/mssql_server"
  sql_server_name = var.sql_server_name
  resource_group_location = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  administrator_login = module.mssql_key_vault.kv_secret_sql_admin_user
  administrator_login_password = module.mssql_key_vault.kv_secret_sql_admin_password
}

module "mssql_virtual_network_rule" {
  source = "./modules/mssql/mssql_server/virtual_network_rule"
  name = var.sql_server_vnet_rule_name
  server_id = module.mssql_server.id
  subnet_id = module.azure_networking.subnet_db_id
}

module "mssql_database" {
  source = "./modules/mssql/mssql_database"
  database_name = module.mssql_server.sql_server_name
  server_id = module.mssql_server.id
  sku_name = var.sql_database_sku
  max_size_gb = var.sql_database_gb_size
}

module "mssql_private_endpoint" {
  source = "./modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_sql_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_db_id
  private_service_connection_name = var.private_service_connection_sql_name
  private_connection_resource_id = module.mssql_server.id
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [ module.azure_networking.private_dns_zone_db_id ]
}


# ====================== MACHINE LEARNING =============================

module "ml_key_vault" {
  source = "./modules/key_vault"
  name = var.keyvault_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  tenant_id = var.tenant_id
  sku_name = var.keyvault_sku
  network_acls_default_action = var.network_acls_default_action
  network_acls_bypass = var.network_acls_bypass
  network_acls_vn_subnet_id = module.azure_networking.subnet_kv_id
}

module "machine_learning_stac" {
  source = "./modules/storage_accounts"
  storage_account_name = var.stac_mlw_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  account_tier = var.stac_mlw_tier
  account_replication_type = var.stac_mlw_replication_type
  tags_environment = var.tags_environment_stac
}

module "ml_stac_network_rules" {
  source = "./modules/storage_accounts/network_rules"
  storage_account_id = module.machine_learning_stac.id
  default_action = var.default_action
  subnet_stac_id = module.azure_networking.subnet_stac_id
  bypass = var.stac_bypass
}

module "ml_stac_private_endpoint" {
  source = "./modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_stac_mlw_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_stac_id
  private_service_connection_name = var.private_service_connection_stac_mlw_name
  private_connection_resource_id = module.machine_learning_stac.storage_account_id
  subresource_names = var.subresource_names_stac_mlw
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [ module.azure_networking.private_dns_zone_stac_blob_id ]
}

module "kv_private_endpoint" {
  source = "./modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_keyvault_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_kv_id
  private_service_connection_name = var.private_service_connection_keyvault_name
  private_connection_resource_id = module.ml_key_vault.id
  subresource_names = var.subresource_kv_names
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [ module.azure_networking.private_dns_zone_kv_id ]
}

module "ml_application_insights" {
  source = "./modules/application_insights"
  appinsight_name = var.appinsight_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  application_type = var.application_type_ml
}

module "ml_application_insights_api_key" {
  source = "./modules/application_insights/api_key"
  api_key_name = var.appinsight_api_key_name
  application_insights_id = module.ml_application_insights.id
  read_permissions = var.appinsight_read_permissions
}

module "machine_learning_workspace" {
  source = "./modules/machine_learning/workspace"
  name = var.mlw_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  application_insights_id = module.ml_application_insights.id
  key_vault_id = module.ml_key_vault.id
  storage_account_id = module.machine_learning_stac.storage_account_id
}

module "mlw_private_endpoint" {
  source = "./modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_mlw_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_kv_id
  private_service_connection_name = var.private_service_connection_mlw_name
  private_connection_resource_id = module.machine_learning_workspace.id
  subresource_names = var.subresource_mlw_names
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [ module.azure_networking.private_dns_zone_mlw_notebooks_id, module.azure_networking.private_dns_zone_mlw_api_id]
}

# ========================== AI SERVICES ==================================

module "srch_search_service" {
  source = "./modules/search_service"
  search_name = var.search_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  search_sku = var.search_sku
  public_network_access_enabled = var.public_network_access_enabled_ai
}

module "srch_private_endpoint" {
  source = "./modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_search_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_ai_id
  private_service_connection_name = var.private_service_connection_search_name
  private_connection_resource_id = module.srch_search_service.id
  subresource_names = var.search_subresource_names
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [ module.azure_networking.private_dns_zone_srch_id ]
}

module "aisa_cognitive_account" {
  source = "./modules/cognitive_account"
  services_account_name = var.ai_services_account_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  kind = var.ai_services_account_kind
  sku_name = var.ai_services_account_sku
  custom_subdomain_name = var.ai_services_account_custom_subdomain_name
  public_network_access_enabled = var.ai_public_network_access_enabled
}

module "aisa_private_endpoint" {
  source = "./modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_aisa_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_ai_id
  private_service_connection_name = var.private_service_connection_aisa_name
  private_connection_resource_id = module.aisa_cognitive_account.id
  subresource_names = var.aisa_subresource_names
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [ module.azure_networking.private_dns_zone_aisa_id ]
}

#pendientes
module "di_cognitive_account" {
  source = "./modules/cognitive_account"
  services_account_name = var.document_intelligence_account_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  kind = var.document_intelligence_kind
  sku_name = var.document_intelligence_sku
  custom_subdomain_name = var.document_intelligence_custom_subdomain_name
  public_network_access_enabled = var.document_intelligence_public_network_access_enabled
}

module "di_private_endpoint" {
  source = "../../modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_di_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_ai_id
  private_service_connection_name = var.private_service_connection_di_name
  private_connection_resource_id = module.di_cognitive_account.id
  subresource_names = var.di_subresource_names
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [module.azure_networking.private_dns_zone_di_id]
}

module "openai_cognitive_account" {
  source = "../../modules/cognitive_account"
  services_account_name = var.openai_account_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  kind = var.openai_kind
  sku_name = var.openai_sku
  custom_subdomain_name = var.openai_custom_subdomain_name
  public_network_access_enabled = var.openai_public_network_access_enabled
}

module "openai_private_endpoint" {
  source = "../../modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_openai_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_ai_id
  private_service_connection_name = var.private_service_connection_openai_name
  private_connection_resource_id = module.openai_cognitive_account.id
  subresource_names = var.openai_subresource_names
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [module.azure_networking.private_dns_zone_oai_id]
}

data "azurerm_client_config" "current" {}

module "bot_service_azure_bot" {
  source = "../../modules/bot_service_azure_bot"
  bot_name = var.bot_name
  resource_group_name = module.resource_group.resource_group_name
  location = var.bot_location
  microsoft_app_id = data.azurerm_client_config.current.client_id
  bot_sku = var.bot_sku
  public_network_access_enabled = var.bot_public_network_access_enabled
}

module "bot_private_endpoint" {
  source = "../../modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_bot_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_ai_id
  private_service_connection_name = var.private_service_connection_bot_name
  private_connection_resource_id = module.bot_service_azure_bot.id
  subresource_names = var.bot_subresource_names
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [module.azure_networking.private_dns_zone_bot_id]
}

module "bot_token_private_endpoint" {
  source = "../../modules/private_endpoint"
  private_endpoint_name = var.private_endpoint_bot_token_name
  resource_group_name = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  subnet_id = module.azure_networking.subnet_ai_id
  private_service_connection_name = var.private_service_connection_bot_token_name
  private_connection_resource_id = module.bot_service_azure_bot.id
  subresource_names = var.bot_token_subresource_names
  resource_group_name_dns = var.resource_group_name_dns
  private_dns_zone_ids = [module.azure_networking.private_dns_zone_bot_token_id]
}




#===#





