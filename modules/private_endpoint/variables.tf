variable "private_endpoint_name" {
  type = string 
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "subnet_id" {
  type = string 
}

variable "private_service_connection_name" {
  type = string 
}

variable "private_connection_resource_id" {
  type = string 
}

variable "subresource_names" {
  type = list(string)
  default = [ "sites" ]
}

variable "resource_group_name_dns" {
  type = string 
}

variable "private_dns_zone_ids" {
  type = list(string)
}
