terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # Azure Backend configuration for State Management
  backend "azurerm" {
    resource_group_name  = "krish-test"
    storage_account_name = "krishtfstate42129"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}
