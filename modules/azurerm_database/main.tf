data "azurerm_mssql_server" "server" {
  for_each = var.databases
  name                = each.value.server_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_mssql_database" "database" {
  for_each = var.databases
  name         = each.value.database_name
  server_id    = data.azurerm_mssql_server.server[each.key].id
  collation    = each.value.collation
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

  tags = {
    environment = each.value.tags.environment
  }

  # prevent the possibility of accidental data loss
  # lifecycle {
  #   prevent_destroy = true
  # }
}