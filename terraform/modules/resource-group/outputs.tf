output "resource_groups" {
  description = "Map of created resource groups"
  value       = azurerm_resource_group.rg
}

output "resource_group_names" {
  description = "Names of the created resource groups"
  value       = { for k, rg in azurerm_resource_group.rg : k => rg.name }
}
