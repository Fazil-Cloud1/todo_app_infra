resource "azurerm_mssql_server" "server" {
  for_each = var.servers
  name                         = each.value.server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.min_tls_version

  # azuread_administrator {
  #   login_username = "Kashif Shivani"
  #   object_id      = "328fa569-b8ac-4c04-bc25-1966b1740fc2"
  # }

   tags = {
    environment = each.value.tags.environment
  }
}