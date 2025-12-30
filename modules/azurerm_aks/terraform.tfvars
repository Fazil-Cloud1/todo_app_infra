akcs = {
  akcs1 = {
  akc_name            = "fakc"
  location            = "central us"
  rg_name             = "rg-dev-test3"
  dns_prefix          = "fakc1"

  default_node_pool = {
    dnp1 = {
      node_name       = "default"
    node_count = 1
    vm_size    = "standard_a2m_v2"
    }
  }

  identity = {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Dev"
  }
  }
}
