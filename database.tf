resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_database_info.server_name
  resource_group_name          = azurerm_resource_group.ntier.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sureshkola"
  administrator_login_password = "Satish@4214"

  tags = {
    env       = "Dev"
    CreatedBy = "Terraform"
  }

  depends_on = [
    azurerm_resource_group.ntier,
    azurerm_virtual_network.ntier
  ]
}

resource "azurerm_mssql_database" "suresh_database" {
  name      = var.sql_database_info.database_name
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = "Basic"

  tags = {
    env       = "Dev"
    CreatedBy = "Terraform"
  }

  depends_on = [
    azurerm_mssql_server.sql_server
  ]
}