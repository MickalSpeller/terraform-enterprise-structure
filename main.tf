resource "azurerm_resource_group" "rg-infra-state" { 
  name     = "rg-project-delta"
  location = "eastus"
}
resource "azurerm_virtual_network" "vnet-hub" {
  name                = "vnet-hub"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-infra-state.location
  resource_group_name = azurerm_resource_group.rg-infra-state.name
}
