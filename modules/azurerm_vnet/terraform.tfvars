# vnets = {
#   vnet1 = {
#     name                = "tvd_vnet"
#     location            = "eastus"
#     resource_group_name = "rg-damon"
#     address_space       = ["10.0.0.0/16"]
#     dns_servers         = ["10.0.0.4", "10.0.0.5"]
#     tags = {
#     environment = "Development"
#   }

#     subnets = [
#       {
#         name             = "fsubnet"
#         address_prefixes = ["10.0.1.0/24"]
#       },
#       {
#         name             = "bsubnet"
#         address_prefixes = ["10.0.2.0/24"]
#       }
#     ]
#   }
#   vnet2 = {
#     name                = "tvd2_vnet"
#     location            = "eastus"
#     resource_group_name = "rg-damon"
#     address_space       = ["10.0.0.0/16"]
#     dns_servers         = ["10.0.0.4", "10.0.0.5"]

#   }
  
# }

vnets = {

  vnet1 = {
    
    # ✅ REQUIRED
    
    name                = "vnet-dev"
    resource_group_name = "rg-damon"
    location            = "west us"

    
    # ✅ OPTIONAL
    
    address_space           = ["10.0.0.0/16"]
    # bgp_community           = "12076:50001"
    # dns_servers             = ["10.0.0.4", "10.0.0.5"]
    # edge_zone               = null
    # flow_timeout_in_minutes = 10
    # private_endpoint_vnet_policies = "Disabled"
    # tags = {
    #   environment = "dev"
    #   owner       = "network-team"
    # }

    
    # ✅ BLOCK : DDOS PROTECTION PLAN (optional)
    
    # ddos_protection_plan = {
    #   # id     = "/subscriptions/xxxxx/resourceGroups/rg-ddos/providers/Microsoft.Network/ddosProtectionPlans/ddos-prod"
    #   enable = true
    # }

    
    # # ✅ BLOCK : ENCRYPTION (optional)
    
    # encryption = {
    #   enforcement = "AllowUnencrypted"
    # }

    
    # # ✅ BLOCK : IP ADDRESS POOL (optional)
    
    # ip_address_pool = [
    #   {
    #     id                     = "/subscriptions/xxxx/resourceGroups/network-rg/providers/Microsoft.Network/networkManagers/nm1/ipamPools/pool1"
    #     number_of_ip_addresses = "100"
    #   }
    # ]

    # ✅ BLOCK : SUBNETS (optional)
    
    subnet = [
      {
        name             = "fsubnet"
        address_prefixes = ["10.0.1.0/24"]

        # security_group                               = "/subscriptions/xxxx/resourceGroups/rg-networking-prod/providers/Microsoft.Network/networkSecurityGroups/nsg-apps"
        # default_outbound_access_enabled               = true
        # private_endpoint_network_policies             = "Disabled"
        # private_link_service_network_policies_enabled = true
        # route_table_id                                = "/subscriptions/xxxx/resourceGroups/rg-networking-prod/providers/Microsoft.Network/routeTables/rt-apps"
        # service_endpoints                             = ["Microsoft.Storage", "Microsoft.Sql"]
        # service_endpoint_policy_ids                   = []

        # delegation = [
        #   {
        #     name = "delegation-appservice"

        #     service_delegation = {
        #       name    = "Microsoft.Web/serverFarms"
        #       actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
        #     }
        #   }
        # ]
      },

      {
        name             = "bsubnet"
        address_prefixes = ["10.0.2.0/24"]

        # security_group                               = null
        # default_outbound_access_enabled               = true
        # private_endpoint_network_policies             = "Disabled"
        # private_link_service_network_policies_enabled = true
        # route_table_id                                = null
        # service_endpoints                             = ["Microsoft.Storage"]
        # service_endpoint_policy_ids                   = []

        # delegation = []
      }
    ]
  }
}