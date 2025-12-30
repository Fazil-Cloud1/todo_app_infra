variable "akcs" {
  type = map(object({
    akc_name = string
    location = string
    rg_name = string
    dns_prefix = string
    default_node_pool = map(object({
        node_name = string
        node_count = number
        vm_size = string
    } 
    ))
    identity = map(string)
    tags     = map(string)
  }))
}