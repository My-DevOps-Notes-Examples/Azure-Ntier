resource "azurerm_network_interface" "appserver_nic" {
  name                = var.app_server_info.nic_name
  location            = azurerm_resource_group.ntier.location
  resource_group_name = azurerm_resource_group.ntier.name
  ip_configuration {
    name                          = "appserver1-ip"
    subnet_id                     = azurerm_subnet.subnets[var.app_server_info.subnet_index].id
    private_ip_address_allocation = "Dynamic"
  }

  depends_on = [
    azurerm_subnet.subnets
  ]
}

resource "azurerm_linux_virtual_machine" "app_server" {
  name                = var.app_server_info.vm_name
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location
  size                = "Standard_B1s"
  admin_username      = "sureshkola"
  admin_password      = "Suresh@3697"
  disable_password_authentication = false
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  network_interface_ids = [
    azurerm_network_interface.appserver_nic.id
  ]
}