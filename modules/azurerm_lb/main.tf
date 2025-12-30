resource "azurerm_lb" "lb" {
  for_each = var.lbs
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = each.value.fip_configuration_name
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "bap" {
  for_each = var.lbs
  name            = each.value.bap_name
  loadbalancer_id = azurerm_lb.lb[each.key].id
}

resource "azurerm_lb_probe" "health_probe" {
  for_each = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.health_probe_name
  port            = each.value.port
}

resource "azurerm_lb_rule" "lb_rule" {
  for_each = var.lbs
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = each.value.lb_rule_name
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.fip_configuration_name
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.bap[each.key].id ]
  probe_id = azurerm_lb_probe.health_probe[each.key].id
}