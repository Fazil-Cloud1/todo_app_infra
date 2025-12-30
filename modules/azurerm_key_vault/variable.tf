variable "kvs" {
  type = map(object({
    kv_name = string
    location = string
    rg_name = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days = number
    sku_name = string
    purge_protection_enabled = bool
    access_policy = map(object({
    
    key_permissions = optional(list(string))

    secret_permissions = optional(list(string))

    storage_permissions = optional(list(string))
      
    
    }))
  }))
}