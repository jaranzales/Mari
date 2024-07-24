variable "api_key_name" {
  type = string
}

variable "application_insights_id" {
  type = string
}

variable "read_permissions" {
  type = list(string)
  default = ["aggregate", "api", "draft", "extendqueries", "search"]
}