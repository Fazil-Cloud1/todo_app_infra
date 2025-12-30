kvs = {
    kv1 = {
        kv_name = "fkeyvault147852"
        location = "westus"
        rg_name = "rg-dev-test3"
        enabled_for_disk_encryption = true
        soft_delete_retention_days = 7
        sku_name = "standard"  
        purge_protection_enabled = false

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