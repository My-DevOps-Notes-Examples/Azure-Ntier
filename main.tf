resource "azurerm_resource_group" "ntier" {
  name     = "ntier-rg"
  location = "eastus"
}

resource "azurerm_virtual_network" "name" {
  name                = "ntier-vn"
  resource_group_name = "ntier-rg"
  address_space       = ["192.168.0.0/16"]
  location            = "eastus"

  depends_on = [
    azurerm_resource_group.ntier
  ]
}