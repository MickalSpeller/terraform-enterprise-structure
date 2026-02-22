terraform {
  backend "azurerm" {
    resource_group_name  = "rg-infrastructure-state"
    storage_account_name = "stgacctprojectdelta"
    container_name       = "test-tfstate"
    key                  = "test.terraform.tfstate"
  }
}
