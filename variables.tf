#SUBSCRIPTION 

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
  default = ""
  sensitive   = true
}

#RESOURCE GROUP
variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "resource_group_tags" {
  type = map(string)
}


# ========================= VIRTUAL NETWORK ===========================

variable "resource_group_name_networking" {
  type = string
}

#SUBNETS

variable "virtual_network_name" {        
  type = string
}

variable "sbnet_wapp_name" {        
  type = string
}

variable "sbnet_stac_name" {        
  type = string
}

variable "sbnet_ai_name" {        
  type = string
}

variable "sbnet_db_name" {        
  type = string
}

variable "sbnet_kv_name" {        
  type        = string
}

#DNS PRIVATE ZONES

variable "resource_group_name_dns" {
  type        = string
}

variable "private_dns_zone_name_wapp" {        
  type = string
}

variable "private_dns_zone_name_db" {        
  type = string
}

variable "private_dns_zone_name_kv" {        
  type = string
}

variable "private_dns_zone_name_stac_blob" {        
  type = string
}

variable "private_dns_zone_name_mlw_notebooks" {        
  type = string
}

variable "private_dns_zone_name_mlw_api" {        
  type = string
}

variable "private_dns_zone_name_srch" {        
  type = string
}

variable "private_dns_zone_name_di" {        
  type = string
}

variable "private_dns_zone_name_bot" {        
  type = string
}

variable "private_dns_zone_name_bot_token" {        
  type = string
}

variable "private_dns_zone_name_aisa" {        
  type = string
}

variable "private_dns_zone_name_oai" {        
  type = string
}

# ========================= DATA FACTORY =========================

variable "data_factory_name" {        
  type = string  
}

variable "managed_virtual_network_enabled" {
  type = bool
  default = true 
}

# ======================= APP SERVICE =================================

#SERVICE_PLAN

variable "app_service_plan_name" {        
  type        = string
}

variable "app_service_os_type" {
  type = string
  default = "Linux"
}

variable "app_service_plan_sku" {
  type        = string
}

#WEB_APP_LINUX_PYTHON_000

variable "wapp_name_000" {        
  type        = string
}

variable "wapp_public_network_access_enabled_000" {
  type = bool
}

variable "wapp_https_only_000" {
  type = bool
  default = true
}

variable "wapp_application_stack_000" {
  type = object({
    python_version = optional(string)
    php_version = optional(string)
    node_version = optional(string)
    java_version = optional(string)
    dotnet_version = optional(string)
    ruby_version = optional(string)
    docker_image = optional(string)
    docker_image_tag = optional(string)
  })
  default = {
    python_version = "3.10"
  }
}

#PRIVATE_ENDPOINT_LINUX_PYTHON_000

variable "private_endpoint_wapp_name_000" {
  type = string
}

variable "private_service_connection_wapp_name_000" {
  type = string
}

variable "subresource_wapp_names_000" {
  type = list(string)
  default = [ "sites" ]
}

#WEB_APP_LINUX_NODE_001

variable "wapp_name_001" {
  type = string
}

variable "wapp_public_network_access_enabled_001" {
  type = bool
  default = false
}

variable "wapp_https_only_001" {
  type = bool
  default = true
}

variable "wapp_application_stack_001" {
  type = object({
    python_version = optional(string)
    php_version = optional(string)
    node_version = optional(string)
    java_version = optional(string)
    dotnet_version = optional(string)
    ruby_version = optional(string)
    docker_image = optional(string)
    docker_image_tag = optional(string)
  })
  default = {
    node_version = "20-lts"
  }
}

#PRIVATE_ENDPOINT_LINUX_NODE_001

variable "private_endpoint_wapp_name_001" {
  type = string
}

variable "private_service_connection_wapp_name_001" {
  type = string
}

variable "subresource_wapp_names_001" {
  type = list(string)
  default = [ "sites" ]
}

# =========================== STORAGE ACCOUNT ==========================

#AZURE_STAC

variable "stac_name" {
  type        = string
}

variable "stac_tier" {        
  type        = string 
}

variable "stac_replication_type" {        
  type        = string 
}

variable "tags_environment_stac" {
  type = string
}

#STAC_NETWORK_RULES

variable "default_action" {
  type = string
  default = "Deny"
}

variable "stac_bypass" {
  type = string
}

#PRIVATE_ENDPOINT_STAC

variable "private_endpoint_stac_name" {
  type = string
}
variable "private_service_connection_stac_name" {
  type = string
}

variable "subresource_names_stac" {
  type = list(string)
}

# ====================== SQL SERVER ====================================

#MSSQL_KEY_VAULT

variable "kv_terraform_name" {
  type = string
}

variable "rg_kv_terraform_name" {
  type = string
}

variable "kv_secret_sql_admin_user" {
  type        = string
}

variable "kv_secret_sql_admin_password" {
  type        = string
}

#MSSQL_SERVER

variable "sql_server_name" {
  type = string
}

#MSSQL_VIRTUAL_NETWORK_RULE

variable "sql_server_vnet_rule_name" {
  type = string
}

#MSSQL_DATABASE
variable "sql_database_name" {        
  type        = string
}

variable "sql_database_sku" {
  type = string
}

variable "sql_database_gb_size" {
  type = number
}

#MSSQL_PRIVATE_ENDPOINT

variable "private_endpoint_sql_name" {
  type = string
}

variable "private_service_connection_sql_name" {
  type = string
}

# ======================== MACHINE LEARNING ============================

#ML_KEY_VAULT
variable "keyvault_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "keyvault_sku" {
  type = string
}

variable "network_acls_default_action" {
  type = string
}

variable "network_acls_bypass" {
  type = string
}

#MACHINE_LEARNING_STAC
variable "stac_mlw_name" {
  type = string
}

variable "stac_mlw_tier" {
  type = string
}

variable "stac_mlw_replication_type" {
  type = string
}

#ML_STAC_PRIVATE_ENDPOINT
variable "private_endpoint_stac_mlw_name" {
  type = string
}

variable "private_service_connection_stac_mlw_name" {
  type = string
}

variable "subresource_names_stac_mlw" {
  type = list(string)
}


#KV_PRIVATE_ENDPOINT
variable "private_endpoint_keyvault_name" {
  type = string
}

variable "private_service_connection_keyvault_name" {
  type = string
}

variable "subresource_kv_names" {
  type = list(string)
}

#ML_APPLICATION_INSIGHTS
variable "appinsight_name" {
  type = string
}

variable "application_type_ml" {
  type = string
}

#ML_APPLICATION_INSIGHTS_API_KEY
variable "appinsight_api_key_name" {
  type = string
}	

variable "appinsight_read_permissions" {
  type = list(string)
}

#MACHINE_LEARNING_WORKSPACE
variable "mlw_name" {
  type = string
}

#MLW_PRIVATE_ENDPOINT
variable "private_endpoint_mlw_name" {
  type = string
}

variable "private_service_connection_mlw_name" {
  type = string
}

variable "subresource_mlw_names" {
  type = list(string)
}

# ========================== AI SERVICES ==================================

#SRCH_SEARCH_SERVICE
variable "search_name" {
  type = string
}

variable "search_sku" {
  type = string
}

variable "public_network_access_enabled_ai" {
  type = string
}

#SRCH_PRIVATE_ENDPOINT
variable "private_endpoint_search_name" {
  type = string
} 

variable "private_service_connection_search_name" {
  type = string
}

variable "search_subresource_names" {
  type = list(string)
}

#AISA_COGNITIVE_ACCOUNT
variable "ai_services_account_name" {
  type = string
}

variable "ai_services_account_kind" {
  type = string
}

variable "ai_services_account_sku" {
  type = string
}

variable "ai_services_account_custom_subdomain_name" {
  type = string
}

variable "ai_public_network_access_enabled" {
  type = bool
}

#AISA_PRIVATE_ENDPOINT
variable "private_endpoint_aisa_name" {
  type = string
}

variable "private_service_connection_aisa_name" {
  type = string
}

variable "aisa_subresource_names" {
  type = list(string)
}

#DI_COGNITIVE_ACCOUNT
variable "document_intelligence_account_name" {
  type = string
}

variable "document_intelligence_kind" {
  type = string
}

variable "document_intelligence_sku" {
  type = string
}

variable "document_intelligence_custom_subdomain_name" {
  type = string
}

variable "document_intelligence_public_network_access_enabled" {
  type = bool
}

#DI_PRIVATE_ENDPOINT
variable "private_endpoint_di_name" {
  type = string
}

variable "private_service_connection_di_name" {
  type = string
}

variable "di_subresource_names" {
  type = list(string)
}

#OPENAI_COGNITIVE_ACCOUNT
variable "openai_account_name" {
  type = string
}

variable "openai_kind" {
  type = string
}

variable "openai_sku" {
  type = string
}

variable "openai_custom_subdomain_name" {
  type = string
}

variable "openai_public_network_access_enabled" {
  type = bool
}

#OPENAI_PRIVATE_ENDPOINT
variable "private_endpoint_openai_name" {
  type = string
}

variable "private_service_connection_openai_name" {
  type = string
}

variable "openai_subresource_names" {
  type = list(string)
}

#BOT_SERVICE_AZURE_BOT
variable "bot_name" {
  type = string
}

variable "bot_location" {
  type = string
}

variable "bot_sku" {
  type = string
}

variable "bot_public_network_access_enabled" {
  type = bool
}

#BOT_PRIVATE_ENDPOINT
variable "private_endpoint_bot_name" {
  type = string
}

variable "private_service_connection_bot_name" {
  type = string
}

variable "bot_subresource_names" {
  type = list(string)
}

#BOT_TOKEN_PRIVATE_ENDPOINT
variable "private_endpoint_bot_token_name" {
  type = string
}

variable "private_service_connection_bot_token_name" {
  type = string
}

variable "bot_token_subresource_names" {
  type = list(string)
}

