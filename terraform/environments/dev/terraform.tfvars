
resource_groups = {
  "rg-dev" = {
    name     = "rg-dev-eastus-01"
    location = "East US"
    tags = {
      Environment = "dev"
      ManagedBy   = "Terraform"
    }
  }
}

vnets = {
  "vnet-dev" = {
    name                = "vnet-dev-eastus-01"
    location            = "East US"
    resource_group_name = "rg-dev-eastus-01"
    address_space       = ["10.0.0.0/16"]
    tags = {
      Environment = "dev"
      ManagedBy   = "Terraform"
    }
  }
}

subnets = {
  "snet-web" = {
    name                = "snet-dev-web-01"
    resource_group_name = "rg-dev-eastus-01"
    vnet_key            = "vnet-dev"
    address_prefixes    = ["10.0.1.0/24"]
  },
  "snet-app" = {
    name                = "snet-dev-app-01"
    resource_group_name = "rg-dev-eastus-01"
    vnet_key            = "vnet-dev"
    address_prefixes    = ["10.0.2.0/24"]
  }
}
