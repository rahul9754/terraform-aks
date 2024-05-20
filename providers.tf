terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.104.0"
    }
  }

  backend "azurerm" {
        resource_group_name   = "myResourceGroup"
        storage_account_name  = "mystorageaccount"
        container_name        = "tfstate"
        key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}