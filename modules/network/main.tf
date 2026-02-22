resource "azurerm_virtual_network" "vnet-hub-01" {
  name                = "vnet-hub-01"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.resource_group_prod.name
  location            = "westus2"
}
