variable "storage_container_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "container_access_type" {
  type = string
  default = "private"
  
}

variable "storage_blob_name" {
  type = string
}

variable "blob_storage_type" {
  type = string
  default = "Block"
}
