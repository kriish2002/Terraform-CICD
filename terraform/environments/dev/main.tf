# 1. Resource Group Module with for_each
module "resource_group" {
  source = "../../modules/resource-group"

  resource_groups = var.resource_groups
}

# 2. Virtual Network & Subnets Module with depends_on
module "vnet" {
  source = "../../modules/vnet"

  vnets   = var.vnets
  subnets = var.subnets

  # Explicit dependency to ensure Resource Group is created before VNet
  depends_on = [
    module.resource_group
  ]
}
