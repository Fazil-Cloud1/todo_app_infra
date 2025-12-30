variable "vms" {
  type = map(object({
    nic_name = string
    subnet_name = string
    vnet_name = string
    location = string
    rg_name = string
    kv_name = string
    vm_username = string
    vm_password = string
    ip_configuration = map(object({
      name = string
      private_ip_address_allocation = string 
    }))
    tags = optional(map(string))
    vm_name = string
    size = string
    disable_password_authentication = bool
    source_image_reference = map(string)
  }
  ))
}