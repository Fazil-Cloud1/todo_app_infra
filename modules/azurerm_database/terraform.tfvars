databases = {
 db1 = {
  server_name = "fserver1"
  rg_name = "rg-dev-test3"
  database_name = "fdb1"
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    environment = "dev"
  }

  # prevent the possibility of accidental data loss
  # lifecycle {
  #   prevent_destroy = true
  # }
}
}