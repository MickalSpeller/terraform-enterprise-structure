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
}
resource "azurerm_subnet" "subnet-hub01" {
  name                 = "subnet-hub01"
  resource_group_name  = azurerm_resource_group.rg-infra.name
  virtual_network_name = azurerm_virtual_network.vnet-hub01.name
  address_prefixes     = ["10.0.1.0/24"] 
}
resource "azurerm_virtual_network" "vnet-spoke01" {
  name                = "vnet-spoke01"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg-infra.location
  resource_group_name = azurerm_resource_group.rg-infra.name  
}
resource "azurerm_subnet" "subnet-spoke01" {
  name                 = "subnet-spoke01"
  resource_group_name  = azurerm_resource_group.rg-infra.name
  virtual_network_name = azurerm_virtual_network.vnet-spoke01.name
  address_prefixes     = ["10.1.1.0/24"]
}
resource "azurerm_subnet" "snet-02" {
 name                  = "snet-02"
 resource_group_name   = azurerm_resource_group.rg-infra.name
 virtual_network_name  = azurerm_virtual_network.vnet-spoke01.name
 address_prefixes      = ["10.1.2.0/24"]
}
