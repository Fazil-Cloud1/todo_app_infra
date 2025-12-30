# resource "azurerm_virtual_network" "vnet" {
#   for_each            = var.vnets
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name
#   address_space       = each.value.address_space
#   dns_servers         = each.value.dns_servers
#   tags                = each.value.tags

#   dynamic "subnet" {
#     for_each = each.value.subnets == null ? [] : each.value.subnets
#     # for_each = lookup(each.value,"subnets",{})
#     content {
#       name             = subnet.value.name
#       addre     }
#   }
# }

# resource "azurerm_network_ddos_protection_plan" "ddos" {
#   name                = "ddos-plan-dev"
#   resource_group_name = "rg-damon"
#   location            = "eastus"
# }

# DDOS plan ID
# azurerm_network_ddos_protection_plan.ddos.id


resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnets



  # ✅ REQUIRED ARGUMENTS

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location



  # ✅ OPTIONAL ARGUMENTS


  # Exactly one of these must be used (address_space OR ip_address_pool)
  address_space = each.value.address_space

  # bgp_community                  = each.value.bgp_community
  # dns_servers                    = each.value.dns_servers
  # edge_zone                      = each.value.edge_zone
  # flow_timeout_in_minutes        = each.value.flow_timeout_in_minutes
  # private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies
  # tags                           = each.value.tags



  # ✅ BLOCK ARGUMENTS



  # -----------------------------
  # ✅ DDOS PROTECTION BLOCK
  # -----------------------------
  # dynamic "ddos_protection_plan" {
  #   for_each = each.value.ddos_protection_plan != null ? [each.value.ddos_protection_plan] : []

  #   content {
  #     id     = azurerm_network_ddos_protection_plan.ddos.id
  #     enable = ddos_protection_plan.value.enable
  #   }
  # }


  # # -----------------------------
  # # ✅ ENCRYPTION BLOCK (ADDED)
  # # -----------------------------
  # # enforcement is REQUIRED (e.g., "AllowUnencrypted")
  # dynamic "encryption" {
  #   for_each = each.value.encryption != null ? [each.value.encryption] : []

  #   content {
  #     enforcement = encryption.value.enforcement
  #   }
  # }


  # # -----------------------------
  # # ✅ IP ADDRESS POOL BLOCK
  # # -----------------------------
  # dynamic "ip_address_pool" {
  #   for_each = each.value.ip_address_pool != null ? each.value.ip_address_pool : []

  #   content {
  #     id                     = ip_address_pool.value.id
  #     number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
  #   }
  # }


  # -----------------------------
  # ✅ SUBNET BLOCK (multiple)
  # -----------------------------
  dynamic "subnet" {
    for_each = each.value.subnet != null ? each.value.subnet : []

    content {
      name                                          = subnet.value.name
      address_prefixes                              = subnet.value.address_prefixes
      # security_group                                = subnet.value.security_group
      # default_outbound_access_enabled               = subnet.value.default_outbound_access_enabled
      # private_endpoint_network_policies             = subnet.value.private_endpoint_network_policies
      # private_link_service_network_policies_enabled = subnet.value.private_link_service_network_policies_enabled
      # route_table_id                                = subnet.value.route_table_id
      # service_endpoints                             = subnet.value.service_endpoints
      # service_endpoint_policy_ids                   = subnet.value.service_endpoint_policy_ids


      # Delegation block
      # dynamic "delegation" {
      #   for_each = subnet.value.delegation != null ? subnet.value.delegation : []

      #   content {
      #     name = delegation.value.name

      #     dynamic "service_delegation" {
      #       # service_delegation is expected as a single object in this template
      #       for_each = delegation.value.service_delegation != null ? [delegation.value.service_delegation] : []

      #       content {
      #         name    = service_delegation.value.name
      #         actions = service_delegation.value.actions != null ? service_delegation.value.actions : []
      #       }
      #     }
      #   }
      # }
    }
  }
}
