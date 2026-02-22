provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "resource_group_dev" { 
  name     = var.resource_group
  location = var.location
}
module "network" {
  source = "../modules/network"
  name   = "vnet-hub-01"
  resource_group_name = azurerm_resource_group.resource_group_dev.name
  location = azurerm_resource_group.resource_group_dev.location
}
