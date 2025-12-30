nsgs = {
nsg1 = {
  nsg_name = "fnsg"
  location            = "westus"
  rg_name = "rg-dev-test3"

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