output "virtual_networks" {
  description = "Map of created Virtual Networks"
  value       = azurerm_virtual_network.vnet
}

output "subnets" {
  description = "Map of created Subnets"
  value       = azurerm_subnet.subnet
}
