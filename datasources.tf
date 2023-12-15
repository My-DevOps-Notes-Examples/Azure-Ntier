data "azurerm_subnet" "app_subnet" {
  name                 = "app"
  virtual_network_name = azurerm_virtual_network.ntier.name
  resource_group_name  = azurerm_resource_group.ntier.name
}