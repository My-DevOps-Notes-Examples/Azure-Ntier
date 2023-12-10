resource "azurerm_resource_group" "ntier" {
  name     = "ntier-rg"
  location = var.location
}

resource "azurerm_virtual_network" "name" {
  name                = "ntier-vn"
  resource_group_name = "ntier-rg"
  address_space       = var.vnet-iprange
  location            = var.location

  depends_on = [
    azurerm_resource_group.ntier
  ]
}