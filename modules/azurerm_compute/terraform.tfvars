vms = {
  vm1 = {
    rg_name = "rg-damon"
    vnet_name = "vnet-dev"
    subnet_name = "fsubnet"
    pip_name = "fpip"
    nic_name = "fnic"
    location = "west us"
   
    ip_configuration = {
      ip_conf1 = {
        name      = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
    tags = {}

    vm_name = "fvm"
    size = "Standard_B1ms"
    admin_username = "faziladmin"
    admin_password = "fazil@123456789"
    disable_password_authentication = false
    source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  }

  vm2 = {
    rg_name = "rg-damon"
    vnet_name = "vnet-dev"
    subnet_name = "bsubnet"
    pip_name = "bpip"
    nic_name = "bnic"
    location = "west us"
   
    ip_configuration = {
      ip_conf1 = {
        name      = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
    tags = {}

    vm_name = "bvm"
    size = "Standard_B1ms"
    admin_username = "faziladmin"
    admin_password = "fazil@123456789"
    disable_password_authentication = false
    
    source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  }
}