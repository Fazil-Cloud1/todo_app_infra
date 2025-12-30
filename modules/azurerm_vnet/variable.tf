# variable "vnets" {
#    type = map(object(
#      {
#          name = string
#          location = string
#          resource_group_name = string
#          address_space = optional(list(string))
#          dns_servers = optional(list(string))
#          tags = optional(map(string))
#          subnets = optional(list(object(
#          {
#              name = string
#              address_prefixes = list(string)
#          }
#          )))
#      }
#    ))
# }

variable "vnets" {
  type = map(object({

    
    # ✅ REQUIRED ARGUMENTS
    
    name                = string
    resource_group_name = string
    location            = string

    
    # ✅ OPTIONAL ARGUMENTS
    
    address_space                  = optional(list(string))
    # bgp_community                  = optional(string)
    # dns_servers                    = optional(list(string))
    # edge_zone                      = optional(string)
    # flow_timeout_in_minutes        = optional(number)
    # private_endpoint_vnet_policies = optional(string)
    # tags                           = optional(map(string))

    
    # # ✅ DDOS PROTECTION BLOCK (optional)
    
    # ddos_protection_plan = optional(object({
    #   # id     = string
    #   enable = bool
    # }))

    
    # # ✅ ENCRYPTION BLOCK (optional)
    
    # encryption = optional(object({
    #   enforcement = string   # e.g., "AllowUnencrypted"
    # }))

    
    # # ✅ IP ADDRESS POOL BLOCK (optional, multiple)
    
    # ip_address_pool = optional(list(object({
    #   id                     = string
    #   number_of_ip_addresses = string
    # })))

    
    # ✅ SUBNET BLOCK (optional, multiple)
    
    subnet = optional(list(object({

      # Required inside subnet
      name             = string
      address_prefixes = list(string)

      # Optional inside subnet
      # security_group                                 = optional(string)
      # default_outbound_access_enabled                = optional(bool)
      # private_endpoint_network_policies              = optional(string)
      # private_link_service_network_policies_enabled  = optional(bool)
      # route_table_id                                 = optional(string)
      # service_endpoints                              = optional(list(string))
      # service_endpoint_policy_ids                    = optional(list(string))

  
      # ✅ Delegation block (optional, multiple)
  
      # delegation = optional(list(object({
      #   name = string

      #   service_delegation = object({
      #     name    = string
      #     actions = optional(list(string))
      #   })
      # })))
    })))
  }))
}
