
variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "application_insights_id" {
  type = string
}

variable "key_vault_id" {
  type = string
}

variable "storage_account_id" {
  type = string
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "identity_type" {
  type    = string
  default = "SystemAssigned"
}

