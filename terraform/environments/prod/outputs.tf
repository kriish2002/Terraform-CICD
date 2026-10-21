output "resource_groups" {
  description = "Outputs from Resource Group module"
  value       = module.resource_group.resource_groups
}

output "vnets" {
  description = "Outputs from VNet module"
  value       = module.vnet.virtual_networks
}

output "subnets" {
  description = "Outputs from Subnet module"
  value       = module.vnet.subnets
}
