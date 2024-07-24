variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "name" {
  type = string
} 

variable "tenant_id" {
  type = string
}

variable "sku_name" {
  type = string 
}

variable "network_acls_default_action" {
  type = string
}

variable "network_acls_bypass" {
  type = string
}

variable "network_acls_vn_subnet_id" {
  type = string
}
