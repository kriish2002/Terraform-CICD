resource_groups = {
  "rg-prod" = {
    name     = "rg-prod-eastus-01"
    location = "East US"
    tags = {
      Environment = "prod"
      ManagedBy   = "Terraform"
    }
  }
}

vnets = {
  "vnet-prod" = {
    name                = "vnet-prod-eastus-01"
    location            = "East US"
    resource_group_name = "rg-prod-eastus-01"
    address_space       = ["10.1.0.0/16"]
    tags = {
      Environment = "prod"
      ManagedBy   = "Terraform"
    }
  }
}

subnets = {
  "snet-web" = {
    name                = "snet-prod-web-01"
    resource_group_name = "rg-prod-eastus-01"
    vnet_key            = "vnet-prod"
    address_prefixes    = ["10.1.1.0/24"]
  },
  "snet-app" = {
    name                = "snet-prod-app-01"
    resource_group_name = "rg-prod-eastus-01"
    vnet_key            = "vnet-prod"
    address_prefixes    = ["10.1.2.0/24"]
  }
}
