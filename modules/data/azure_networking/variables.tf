#RESOURCE GROUP

variable "resource_group_name_networking" {
  type        = string
}

variable "resource_group_name_dns" {
  type = string
}

#PROVIDER

variable "subscription_id_trv" {
  type        = string
  description = "DNS Subscription ID"
  default     = "182e84ac-5f70-47e9-a016-6b2b91ce994d" #####VERIFICAR#####
  sensitive   = true
}

#VIRTUAL NETWORK

variable "virtual_network_name" {        
  type        = string
}

#SUBNETS

variable "sbnet_wapp_name" {        
  type        = string
}

variable "sbnet_stac_name" {        
  type        = string
}

variable "sbnet_ai_name" {        
  type        = string
}

variable "sbnet_db_name" {        
  type        = string
}

variable "sbnet_kv_name" {        
  type        = string
}

#DNS PRIVATE ZONES

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
