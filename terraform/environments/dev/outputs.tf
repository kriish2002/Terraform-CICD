output "resource_groups" {
  description = "Created Resource Groups"
  value       = module.resource_group.resource_groups
}

output "vnets" {
  description = "Created Virtual Networks"
  value       = module.vnet.virtual_networks
}

output "subnets" {
  description = "Created Subnets"
  value       = module.vnet.subnets
}
