variable "location" {
  type        = string
  default     = "eastus"
  description = "location to create resource"
}

variable "vnet-iprange" {
  type        = list(string)
  default     = ["192.168.0.0/16"]
  description = "vnet ip range"
}