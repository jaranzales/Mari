variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "data_factory_name" {
  type = string
}

variable "managed_virtual_network_enabled" {
  type = bool
  default = true
}

variable "public_network_enabled" {
  type = bool
  default = false
}


variable "identity_type" {
  type = string
  default = "SystemAssigned"
}