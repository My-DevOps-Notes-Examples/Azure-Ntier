resource "azurerm_resource_group" "server_rg" {
  name     = var.network_info.rg_name
  location = var.location

  tags = {
    CreatedBy = "Terraform"
  }
}

resource "azurerm_virtual_network" "server_vn" {
  name                = var.network_info.vn_name
  resource_group_name = azurerm_resource_group.server_rg.name
  address_space       = [var.network_info.ip_range]
  location            = var.location

  tags = {
    CreatedBy = "Terraform"
  }

  depends_on = [
    azurerm_resource_group.server_rg
  ]
}

resource "azurerm_subnet" "subnets" {
  count                = length(var.network_info.subnet_names)
  name                 = var.network_info.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.server_rg.name
  virtual_network_name = azurerm_virtual_network.server_vn.name
  address_prefixes     = [cidrsubnet(var.network_info.ip_range, 8, count.index)]

  depends_on = [
    azurerm_resource_group.server_rg,
    azurerm_virtual_network.server_vn
  ]
}