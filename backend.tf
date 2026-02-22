terraform {
  backend "azurerm" {
    resource_group_name  = "rg-infrastructure-state"
    storage_account_name = "storageaccountprojectdelta"
    container_name       = "infra-tfstate"
    key                  = "infra.terraform.tfstate"
  }
}