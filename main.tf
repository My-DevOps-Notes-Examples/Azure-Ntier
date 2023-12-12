resource "azurerm_resource_group" "ntier" {
  name     = "ntier-rg"
  location = var.location
}

resource "azurerm_virtual_network" "ntier" {
  name                = "ntier-vn"
  resource_group_name = "ntier-rg"
  address_space       = var.ntier_vpc_info.cidr_range
  location            = var.location

  depends_on = [
    azurerm_resource_group.ntier
  ]
}

resource "azurerm_subnet" "subnets" {
  count                = length(var.ntier_vpc_info.subnets_names)
  name                 = var.ntier_vpc_info.subnets_names[count.index]
  resource_group_name  = azurerm_resource_group.ntier.name
  virtual_network_name = azurerm_virtual_network.ntier.name
  address_prefixes     = [cidrsubnet(var.ntier_vpc_info.cidr_range[0], 8, count.index)]

  depends_on = [
    azurerm_virtual_network.ntier
  ]
}