sgs = {
  stg1 = {
    sa_name                           = "stgaccount159"
    location                          = "west us"
    resource_group_name               = "rg-damon"
    account_tier                      = "Standard"
    account_replication_type          = "LRS"
    account_kind                      = "BlobStorage"
    cross_tenant_replication_enabled  = "true"
    access_tier                       = "Cold"

    network_rules = {
     rule1 =  {
    default_action = "Deny"
    bypass = ["AzureServices"]
    ip_rules = ["100.0.0.1"]
  }
    }
  }
}