resource "azurerm_resource_group" "rg-infra" { 
  name     = "rg-project-delta"
  location = "eastus"
}
moved {
  from = azurerm_resource_group.resource_group_infrastructure_state
  to   = azurerm_resource_group.rg-infra
}
resource "azurerm_virtual_network" "vnet-hub01" {
  name                = "vnet-hub01"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-infra.location
  resource_group_name = azurerm_resource_group.rg-infra.name

  subnet{
      name = "subnet-hub01"
      address_prefixes = ["10.0.1.0/24"]
  }
}
