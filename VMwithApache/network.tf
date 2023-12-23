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

resource "azurerm_public_ip" "appserver_ip" {
  name                = var.network_info.appserver_ip_name
  resource_group_name = azurerm_resource_group.server_rg.name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    CreatedBy = "Terraform"
  }
}

resource "azurerm_network_interface" "server_nic" {
  name                = var.network_info.nic_name
  location            = var.location
  resource_group_name = azurerm_resource_group.server_rg.name
  ip_configuration {
    name                          = "appserver-1"
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.appserver_ip.id
  }

  tags = {
    CreatedBy = "Terraform"
  }

  depends_on = [
    azurerm_subnet.subnets,
    azurerm_public_ip.appserver_ip
  ]
}