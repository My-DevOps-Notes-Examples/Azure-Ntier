variable "location" {
  type    = string
  default = "eastus"
}

variable "network_info" {
  type = object({
    rg_name      = string
    vn_name      = string
    ip_range     = string
    subnet_names = list(string)
  })
  default = {
    rg_name      = "server-rg"
    vn_name      = "server-vn"
    ip_range     = "192.168.0.0/16"
    subnet_names = ["app", "web"]
  }
}