provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "resource_group_infrastructure_state" { 
  name     = "rg-infrastructure-state"
  location = "useast"
}
module "network" {
  source = "../modules/network"
  name   = "vnet-hub-01"
  resource_group_name = azurerm_resource_group.resource_group_prod.name
  location = azurerm_resource_group.resource_group_prod.location
}
