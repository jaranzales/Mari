variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "wapp_name" {
  type = string
}

variable "service_plan_id" {
  type = string
  
}

variable "public_network_access_enabled" {
  type = bool
}

variable "https_only" {
  type = bool
  default = true
}

variable "application_stack" {
  description = "Application stack configuration for the web app"
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
}
