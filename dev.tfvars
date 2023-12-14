location = "eastus"
ntier_vpc_info = {
  resource_group_name  = "ntier-rg"
  virtual_network_name = "ntier-vnet"
  cidr_range           = ["10.100.0.0/16"]
  subnets_names        = ["web", "app"]
}