variable "baps" {
  type = map(object({
    lb_name = string
    resource_group_name = string
    bap_name = string
    nic_name = string
    ip_configuration_name = string
  }))
}