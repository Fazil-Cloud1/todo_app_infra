rgs = {

  "rg-1" = {
    name       = "rg-dev-test3"
    location   = "westus"
    managed_by = "terraform"
    tags = {
      environment = "dev"
      owner       = "tvd"
    }
  }

  # "rg-2" = {
  #   name       = "rg-stefan"
  #   location   = "westus"
  #   managed_by = "terraform"
  #   tags = {
  #     environment = "preprod"
  #     owner       = "tvd"
  #   }
  # }

  # "rg-3" = {
  #   name       = "rg-klaus"
  #   location   = "westus"
  #   managed_by = "terraform"
  #   tags = {
  #     environment = "preprod"
  #     owner       = "tvd"
  #   }
  # }
}

sgs = {
  stg1 = {
    sa_name                          = "stgaccount1563"
    location                         = "westus"
    resource_group_name              = "rg-dev-test3"
    account_tier                     = "Standard"
    account_replication_type         = "LRS"
    account_kind                     = "BlobStorage"
    cross_tenant_replication_enabled = "true"
    access_tier                      = "Cold"

    network_rules = {
      rule1 = {
        default_action = "Deny"
        bypass         = ["AzureServices"]
        ip_rules       = ["100.0.0.1"]
      }
    }
  }

  # stg2 = {
  #   sa_name                     = "stgaccount160"
  #   location                 = "westus"
  #   resource_group_name      = "rg-stefan"
  #   account_tier             = "Standard"
  #   account_replication_type = "LRS"
  #   account_kind             = "FileStorage"
  #   access_tier              = "Cool"
  # }

  # stg3 = {
  #   sa_name                     = "stgaccount161"
  #   location                 = "westus"
  #   resource_group_name      = "rg-klaus"
  #   account_tier             = "Standard"
  #   account_replication_type = "LRS"
  # }
}


# vnets = {
#   vnet1 = {
#     name                = "tvd_vnet"
#     location            = "westus"
#     resource_group_name = "rg-dev-test3"
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
#     location            = "westus"
#     resource_group_name = "rg-dev-test3"
#     address_space       = ["10.0.0.0/16"]
#     dns_servers         = ["10.0.0.4", "10.0.0.5"]

#   }

# }

vnets = {

  vnet1 = {

    # ✅ REQUIRED

    name                = "vnet-dev"
    resource_group_name = "rg-dev-test3"
    location            = "westus"


    # ✅ OPTIONAL

    address_space = ["10.0.0.0/16"]
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
      },
      {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/24"]
      }
    ]
  }

  # vnet2 = {
  #   name                = "vnet2-dev"
  #   resource_group_name = "rg-stefan"
  #   location            = "westus"

  #   ip_address_pool = [
  #     {
  #       id                     = "/subscriptions/xxxx/resourceGroups/network-rg/providers/Microsoft.Network/networkManagers/nm1/ipamPools/pool2"
  #       number_of_ip_addresses = "200"
  #     }
  #   ]
  # }
}


pips = {
  pip1 = {
    # ------------------------
    # ✅ Required
    # ------------------------
    name                = "bspip"
    resource_group_name = "rg-dev-test3"
    location            = "westus"
    allocation_method   = "Static"

    # ------------------------
    # ✅ Optional
    # ------------------------
    zones                   = null
    ddos_protection_mode    = null
    ddos_protection_plan_id = null
    domain_name_label       = null
    domain_name_label_scope = null
    edge_zone               = null
    idle_timeout_in_minutes = null
    ip_tags                 = {}
    ip_version              = "IPv4"
    public_ip_prefix_id     = null
    reverse_fqdn            = null
    sku                     = "Standard"
    sku_tier                = "Regional"
    tags = {
      environment = "dev"
    }
  }

  pip2 = {
    # ------------------------
    # ✅ Required
    # ------------------------
    name                = "lbpip"
    resource_group_name = "rg-dev-test3"
    location            = "westus"
    allocation_method   = "Static"

    # ------------------------
    # ✅ Optional
    # ------------------------
    zones                   = null
    ddos_protection_mode    = null
    ddos_protection_plan_id = null
    domain_name_label       = null
    domain_name_label_scope = null
    edge_zone               = null
    idle_timeout_in_minutes = 10
    ip_tags                 = {}
    ip_version              = "IPv4"
    public_ip_prefix_id     = null
    reverse_fqdn            = null
    sku                     = "Standard"
    sku_tier                = "Regional"
    tags = {
      environment = "dev"
    }
  }
}

vms = {
  vm1 = {
    rg_name     = "rg-dev-test3"
    vnet_name   = "vnet-dev"
    subnet_name = "fsubnet"
    nic_name    = "fnic"
    location    = "westus"
    kv_name     = "fkeyvault147896"
    vm_username = "username"
    vm_password = "password"

    ip_configuration = {
      ip_conf1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
    tags = {}

    vm_name                         = "fvm"
    size                            = "Standard_D2s_v3"
    disable_password_authentication = false
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

  vm2 = {
    rg_name     = "rg-dev-test3"
    vnet_name   = "vnet-dev"
    subnet_name = "bsubnet"
    nic_name    = "bnic"
    location    = "westus"
    kv_name     = "fkeyvault147896"
    vm_username = "username"
    vm_password = "password"

    ip_configuration = {
      ip_conf1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
    tags = {}

    vm_name                         = "bvm"
    size                            = "Standard_D2s_v3"
    disable_password_authentication = false

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

kvs = {
  kv1 = {
    kv_name                     = "fkeyvault147896"
    location                    = "westus"
    rg_name                     = "rg-dev-test3"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    sku_name                    = "standard"
    purge_protection_enabled    = false

    access_policy = {
      ap1 = {
        key_permissions = [
          "Get",
        ]

        secret_permissions = [
          "Backup",
          "Delete",
          "Get",
          "List",
          "Purge",
          "Recover",
          "Restore",
          "Set"
        ]

        storage_permissions = [
          "Get",
        ]
      }
    }
  }
}

kvsc = {
  kvsc1 = {
    kv_name    = "fkeyvault147896"
    rg_name    = "rg-dev-test3"
    kvsc_name  = "username"
    kvsc_value = "faziladmin"
  }

  kvsc2 = {
    kv_name    = "fkeyvault147896"
    rg_name    = "rg-dev-test3"
    kvsc_name  = "password"
    kvsc_value = "Fazil@123456789"
  }
}

servers = {
  server1 = {
    server_name                  = "fserver1"
    rg_name                      = "rg-dev-test3"
    location                     = "westus"
    version                      = "12.0"
    administrator_login          = "Fazil@admin"
    administrator_login_password = "Fazil@123456789"
    min_tls_version              = "1.2"

    tags = {
      environment = "production"
    }
  }
}

databases = {
  db1 = {
    server_name   = "fserver1"
    rg_name       = "rg-dev-test3"
    database_name = "fdb1"
    collation     = "SQL_Latin1_General_CP1_CI_AS"
    max_size_gb   = 2
    sku_name      = "S0"
    enclave_type  = "VBS"

    tags = {
      environment = "dev"
    }

    # prevent the possibility of accidental data loss
    # lifecycle {
    #   prevent_destroy = true
    # }
  }
}

nsgs = {
  nsg1 = {
    nsg_name = "fnsg"
    location = "westus"
    rg_name  = "rg-dev-test3"

    security_rule = {
      rule1 = {
        name                       = "test123"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }

    tags = {
      environment = "Production"
    }
  }
}

bastions = {
  bastion1 = {
    bastion_name = "fbastion"
    location = "westus"
    resource_group_name = "rg-dev-test3"
    ip_configuration_name = "configuration"
    virtual_network_name = "vnet-dev"
    bastion_subnet_name = "AzureBastionSubnet"
    pip_name = "bspip"
  }
}

lbs = {
  lb1 = {
    lb_name = "flb"
    location = "westus"
    resource_group_name = "rg-dev-test3"
    pip_name = "lbpip"
    fip_configuration_name = "configuration"
    bap_name = "fbap"
    health_probe_name = "fhprobe"
    port = 22
    lb_rule_name = "flbrule"
    protocol = "Tcp"
    frontend_port = 80
    backend_port = 80
  }
}

baps = {
  vm1 = {
    lb_name = "flb"
    resource_group_name = "rg-dev-test3"
    bap_name = "fbap"
    nic_name = "fnic"
    ip_configuration_name = "internal"
  }
   vm2 = {
    lb_name = "flb"
    resource_group_name = "rg-dev-test3"
    bap_name = "fbap"
    nic_name = "bnic"
    ip_configuration_name = "internal"
  }
}

