pips = {
  pip1 = {
    # ------------------------
    # ✅ Required
    # ------------------------
    name                = "fpip"
    resource_group_name = "rg-damon"
    location            = "west us"
    allocation_method   = "Static"

    # ------------------------
    # ✅ Optional
    # ------------------------
    zones                    = null
    ddos_protection_mode     = null
    ddos_protection_plan_id  = null
    domain_name_label        = null
    domain_name_label_scope  = null
    edge_zone                = null
    idle_timeout_in_minutes  = null
    ip_tags                  = {}
    ip_version               = "IPv4"
    public_ip_prefix_id      = null
    reverse_fqdn             = null
    sku                      = "Standard"
    sku_tier                 = "Regional"
    tags                     = {
      environment = "dev"
    }
  }

  pip2 = {
    # ------------------------
    # ✅ Required
    # ------------------------
    name                = "bpip"
    resource_group_name = "rg-damon"
    location            = "west us"
    allocation_method   = "Static"

    # ------------------------
    # ✅ Optional
    # ------------------------
    zones                    = null
    ddos_protection_mode     = null
    ddos_protection_plan_id  = null
    domain_name_label        = null
    domain_name_label_scope  = null
    edge_zone                = null
    idle_timeout_in_minutes  = 10
    ip_tags                  = {}
    ip_version               = "IPv4"
    public_ip_prefix_id      = null
    reverse_fqdn             = null
    sku                      = "Standard"
    sku_tier                 = "Regional"
    tags = {
      environment = "dev"
    }
  }
}