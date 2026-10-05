terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # Azure Backend configuration for State Management in CI/CD
  # backend "azurerm" {
  #   resource_group_name  = "rg-terraform-tfstate"
  #   storage_account_name = "sttfstatecicd001"
  #   container_name       = "tfstate"
  #   key                  = "dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}
