servers = {
  server1 = {
  server_name = "fserver1"
  rg_name = "rg-dev-test3"
  location = "westus" 
  version = "12.0"
  administrator_login = "Fazil@admin"
  administrator_login_password = "Fazil@123456789"
  min_tls_version = "1.2"

   tags = {
    environment = "production"
  }  
  }
}