variable "kv_terraform_name" {
  type = string
}

variable "rg_kv_terraform_name" {
  type = string
}

variable "kv_secret_sql_admin_user" {
  description = "The secret for SQL admin username"
  type        = string
}

variable "kv_secret_sql_admin_password" {
  description = "The secret for SQL admin password"
  type        = string
}