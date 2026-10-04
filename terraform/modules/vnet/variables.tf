variable "vnets" {
  description = "Map of Virtual Networks"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string), {})
  }))
}

variable "subnets" {
  description = "Map of Subnets"
  type = map(object({
    name                = string
    resource_group_name = string
    vnet_key            = string
    address_prefixes    = list(string)
  }))
  default = {}
}
