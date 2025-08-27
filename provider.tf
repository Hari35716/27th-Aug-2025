terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.31.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "6e848e4e-e7b8-4c48-b364-1632f4846bd0"
}