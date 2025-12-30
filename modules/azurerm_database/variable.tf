variable "databases" {
  type = map(object({
    server_name = string
    rg_name = string
    database_name = string
    collation = string
    max_size_gb = number
    sku_name = string
    enclave_type = string
    tags = map(string)
  }))
}