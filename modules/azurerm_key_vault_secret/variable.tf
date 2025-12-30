variable "kvsc" {
  type = map(object({
        kv_name = string
        rg_name = string
        kvsc_name = string
        kvsc_value = string 
  }))
}

