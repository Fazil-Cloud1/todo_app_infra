data "azurerm_key_vault" "kv" {
  for_each = var.kvsc
  name                = each.value.kv_name 
  resource_group_name = each.value.rg_name
}

resource "azurerm_key_vault_secret" "kvsc" {
  for_each = var.kvsc
  name         = each.value.kvsc_name
  value        = each.value.kvsc_value
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}