variable "location" {
  type    = string
  default = "eastus"
}

variable "network_info" {
  type = object({
    rg_name           = string
    vn_name           = string
    ip_range          = string
    subnet_names      = list(string)
    nic_name          = string
    appserver_ip_name = string
  })
  default = {
    rg_name           = "server-rg"
    vn_name           = "server-vn"
    ip_range          = "192.168.0.0/16"
    subnet_names      = ["app", "web"]
    nic_name          = "server-nic"
    appserver_ip_name = "app-ip"
  }
}