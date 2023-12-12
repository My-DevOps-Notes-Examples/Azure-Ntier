variable "location" {
  type        = string
  default     = "eastus"
  description = "location to create resource"
}

variable "ntier_vpc_info" {
  type = object({
    cidr_range    = list(string)
    subnets_names = list(string)
  })
  default = {
    cidr_range    = ["192.168.0.0/16"]
    subnets_names = ["app", "web", "db"]
  }
}