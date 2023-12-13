location = "eastus"
ntier_vpc_info = {
  cidr_range    = ["10.100.0.0/16"]
  subnets_names = ["app", "db"]
}
names = {
  resource_group  = "ntier-rg"
  virtual_network = "ntier-vnet"
}