terraform {
  backend "azurerm" {
    resource_group_name  = "rg-infra"
    storage_account_name = "infrastorageacctpjdelta"
    container_name       = "infra-tfstate"
    key                  = "infra.terraform.tfstate"
  }
} 