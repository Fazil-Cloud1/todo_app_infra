variable "lbs" {
  type = map(object({
    lb_name = string
    location = string
    resource_group_name = string
    pip_name = string
    fip_configuration_name = string
    bap_name = string
    health_probe_name = string
    port = number
    lb_rule_name = string
    protocol = string
    frontend_port = number
    backend_port = number
  }))
}

