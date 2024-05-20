terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.104.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "st-backend"  
    storage_account_name = "sttfstate528745"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}