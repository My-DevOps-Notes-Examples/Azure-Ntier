variable "location" {
  type        = string
  default     = "eastus"
  description = "location to create resource"
}

variable "ntier_vpc_info" {
  type = object({
    resource_group_name  = string
    virtual_network_name = string
    cidr_range           = list(string)
    subnets_names        = list(string)
  })
  default = {
    resource_group_name  = "ntier-rg"
    virtual_network_name = "ntier-vnet"
    cidr_range           = ["192.168.0.0/16"]
    subnets_names        = ["app", "web", "db"]
  }
}

variable "sql_database_info" {
  type = object({
    server_name   = string
    database_name = string
  })
  default = {
    server_name   = "sureshkola-sql-server"
    database_name = "sureshkola-emp"
  }
}