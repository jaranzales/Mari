subscription_id = "d92c9bc4-d242-48e1-a224-9b9c93d46134"

resource_group_name = "az-sc-qa-rg-mari-000"
resource_group_location = "eastus2"
resource_group_tags = {
  environment = "qa"
}

# ========================= VIRTUAL NETWORK ========================
resource_group_name_networking  = "az-sc-dev-rg-networking-000"
virtual_network_name = "az-sc-qa-vnet-000"
#SUBNETS
sbnet_wapp_name = "az-sc-qa-snet-wapp-000"
sbnet_stac_name = "az-sc-qa-snet-stac-000" 
sbnet_ai_name = "az-sc-qa-snet-ai-000"
sbnet_kv_name = "az-sc-qa-snet-kv-000"
sbnet_db_name = "az-sc-qa-snet-db-001"
#DNS PRIVATE ZONES
resource_group_name_dns = "az-trv-hubdev-rg-networking-001"
private_dns_zone_name_wapp = "privatelink.azurewebsites.net"
private_dns_zone_name_db = "privatelink.database.windows.net"
private_dns_zone_name_kv = "privatelink.vaultcore.azure.net"
private_dns_zone_name_stac_blob = "privatelink.blob.core.windows.net" 
private_dns_zone_name_mlw_notebooks = "privatelink.notebooks.azure.net"
private_dns_zone_name_mlw_api = "privatelink.api.azureml.ms" 
private_dns_zone_name_srch = "privatelink.search.windows.net"
private_dns_zone_name_bot = "privatelink.directline.botframework.com"
private_dns_zone_name_bot_token = "privatelink.token.botframework.com"
private_dns_zone_name_di = "privatelink.cognitiveservices.azure.com"
private_dns_zone_name_aisa = "privatelink.cognitiveservices.azure.com"
private_dns_zone_name_oai = "privatelink.openai.azure.com"

# ========================= DATA FACTORY ==============================
data_factory_name = "az-sc-qa-adf-mari-000"
managed_virtual_network_enabled = true

# ======================= APP SERVICE =================================

#SERVICE_PLAN
app_service_plan_name = "az-sc-qa-asp-mari-000"
app_service_os_type = "Linux"
app_service_plan_sku = "B1"

#WEB_APP_LINUX_PYTHON_000
wapp_name_000 = "az-sc-qa-wapp-mari-000"
wapp_public_network_access_enabled_000 = false
wapp_https_only_000 = false
wapp_application_stack_000 = {
  python_version = "3.8"
}

#PRIVATE_ENDPOINT_LINUX_PYTHON_000
private_endpoint_wapp_name_000 = "az-sc-qa-pep-wapp-mari-000"
private_service_connection_wapp_name_000 = "az-sc-qa-psc-wapp-mari-000"
subresource_wapp_names_000 = [ "sites" ]

#WEB_APP_LINUX_NODE_001
wapp_name_001 = "az-sc-qa-wapp-mari-001"
wapp_public_network_access_enabled_001 = false
wapp_https_only_001 = true
wapp_application_stack_001 = {
  node_version = "20-lts"
}

#PRIVATE_ENDPOINT_LINUX_NODE_001
private_endpoint_wapp_name_001 = "az-sc-qa-pep-wapp-mari-001"
private_service_connection_wapp_name_001 = "az-sc-qa-psc-wapp-mari-001"
subresource_wapp_names_001 = [ "sites" ]

# =========================== STORAGE ACCOUNT ==========================

#AZURE_STAC
stac_name = "azscqastacmari001"
stac_tier = "Standard"
stac_replication_type = "LRS"
tags_environment_stac = "qa"

#STAC_NETWORK_RULES
default_action = "Deny"
stac_bypass = "AzureServices"

#PRIVATE_ENDPOINT_STAC
private_endpoint_stac_name = "az-sc-qa-pep-stac-mari-000"
private_service_connection_stac_name = "az-sc-qa-psc-stac-mari-000"
subresource_names_stac = [ "blob" ]

# ====================== SQL SERVER ====================================

#MSSQL_KEY_VAULT
kv_terraform_name = "az-sc-qa-kv-tf-000"              
rg_kv_terraform_name = "az-sc-qa-rg-terraform-000"
kv_secret_sql_admin_user = "sql-kv-admin-user"
kv_secret_sql_admin_password = "sql-kv-admin-pass" 

#MSSQL_SERVER
sql_server_name = "az-sc-qa-sql-mari-000"

#MSSQL_VIRTUAL_NETWORK_RULE
sql_server_vnet_rule_name = "az-sc-qa-sql-rule-mari-000"
sql_database_sku = "S1"
sql_database_gb_size = "250"

#MSSQL_PRIVATE_ENDPOINT
private_endpoint_sql_name = "$(private_endpoint_sql_name)"
private_service_connection_sql_name = "$(private_service_connection_sql_name)"

# ================== MACHINE LEARNING =========================

#ML_KEY_VAULT
keyvault_name = "az-sc-qa-kv-mlw-mari-000"
tenant_id = "a0e552ce-907e-4910-91e0-dc3bf25800bd"
keyvault_sku = "standard"
network_acls_default_action = "Deny"
network_acls_bypass = "AzureServices"

#MACHINE_LEARNING_STAC
stac_mlw_name = "azscqastacmlwmari001"
stac_mlw_tier = "Standard"
stac_mlw_replication_type = "LRS"

#ML_STAC_PRIVATE_ENDPOINT
private_endpoint_stac_mlw_name = "az-sc-qa-pep-stac-mlw-mari-000"
private_service_connection_stac_mlw_name = "az-sc-qa-psc-stac-mlw-mari-000"
subresource_names_stac_mlw = [ "blob" ]

#KV_PRIVATE_ENDPOINT
private_endpoint_keyvault_name = "az-sc-qa-pep-kv-mari-000"
private_service_connection_keyvault_name = "az-sc-qa-psc-kv-mari-000"
subresource_kv_names = [ "vault" ]

#ML_APPLICATION_INSIGHTS
appinsight_name = "az-sc-qa-appi-mari-000"
application_type_ml = "web"

#ML_APPLICATION_INSIGHTS
appinsight_name = "$(appinsight_name)"
application_type_ml = "$(application_type_ml)"

#ML_APPLICATION_INSIGHTS_API_KEY
appinsight_api_key_name = "az-sc-qa-appi-key-mari-000"
appinsight_read_permissions = ["aggregate", "api", "draft", "extendqueries", "search"]

#MACHINE_LEARNING_WORKSPACE
mlw_name = "az-sc-qa-mlw-mari-000"

#MLW_PRIVATE_ENDPOINT
private_endpoint_mlw_name = "az-sc-qa-pep-mlw-mari-000"
private_service_connection_mlw_name = "az-sc-qa-psc-mlw-mari-000"
subresource_mlw_names = ["amlworkspace"]

#SRCH_SEARCH_SERVICE
search_name = "az-sc-qa-srch-mari-000"
search_sku = "basic"
public_network_access_enabled_ai = false

#SRCH_PRIVATE_ENDPOINT
private_endpoint_search_name = "az-sc-pep-qa-srch-mari-000"
private_service_connection_search_name = "az-sc-qa-psc-srch-mari-000"
search_subresource_names = ["searchservice"]

#AISA_COGNITIVE_ACCOUNT
ai_services_account_name = "az-sc-qa-aisa-mari-000"
ai_services_account_kind = "CognitiveServices"
ai_services_account_sku = "S0"
ai_services_account_custom_subdomain_name = "qa-aisa-mari-000"
ai_public_network_access_enabled = false

#AISA_PRIVATE_ENDPOINT
private_endpoint_aisa_name = "az-sc-pep-qa-aisa-mari-000"
private_service_connection_aisa_name = "az-sc-qa-psc-aisa-mari-000" 
aisa_subresource_names = ["account"]


document_intelligence_account_name = "$(document_intelligence_account_name)"
document_intelligence_kind = "$(document_intelligence_kind)"
document_intelligence_sku = "$(document_intelligence_sku)"
document_intelligence_custom_subdomain_name = "$(document_intelligence_custom_subdomain_name)"
document_intelligence_public_network_access_enabled = $(document_intelligence_public_network_access_enabled)

private_endpoint_di_name = "$(private_endpoint_di_name)"
private_service_connection_di_name = "$(private_service_connection_di_name)"
di_subresource_names = ["account"]

openai_account_name = "$(openai_account_name)"
openai_kind = "$(openai_kind)"
openai_sku = "$(openai_sku)"
openai_custom_subdomain_name = "$(openai_custom_subdomain_name)"
openai_public_network_access_enabled = $(openai_public_network_access_enabled)

private_endpoint_openai_name = "$(private_endpoint_openai_name)"
private_service_connection_openai_name = "$(private_service_connection_openai_name)"
openai_subresource_names = ["account"]

bot_name = "$(bot_name)"
bot_location = "$(bot_location)"
bot_sku = "$(bot_sku)"
public_network_access_enabled = $(public_network_access_enabled)

private_endpoint_bot_name = "$(private_endpoint_bot_name)"
private_service_connection_bot_name = "$(private_service_connection_bot_name)" 
bot_subresource_names = ["bot"]


