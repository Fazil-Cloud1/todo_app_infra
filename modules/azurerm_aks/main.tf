resource "azurerm_kubernetes_cluster" "akc" {
  for_each = var.akcs
  name                = each.value.akc_name
  location            = each.value.location
  resource_group_name = each.value.rg_name 
  dns_prefix          = each.value.dns_prefix

  dynamic default_node_pool {
    for_each = each.value.default_node_pool
    content {
      name       = default_node_pool.value.node_name
      node_count = default_node_pool.value.node_count
      vm_size    = default_node_pool.value.vm_size
    }
    
  }

  identity {
    type = each.value.identity.type
  }

  tags = {
    Environment = each.value.tags.Environment
  }
}
