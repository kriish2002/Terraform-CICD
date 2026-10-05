resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnets

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.vnet_key].name
  address_prefixes     = each.value.address_prefixes
}
