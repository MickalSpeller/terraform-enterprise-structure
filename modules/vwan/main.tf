resource "azurerm_virtual_wan" "vwan" {
  name                = "vwan-global"
  location            = var.east_region
  resource_group_name = "rg-project-delta"
}
resource "azurerm_virtual_hub" "east_hub" {
  name                = "vhub-east"
  location            = var.east_region
  resource_group_name = "rg-project-delta"
  virtual_wan_id      = azurerm_virtual_wan.vwan.id
  address_prefix      = "10.0.0.0/23"
}
resource "azurerm_virtual_hub" "west_hub" {
  name                = "vhub-west"
  location            = var.west_region
  resource_group_name = "rg-project-delta"
  virtual_wan_id      = azurerm_virtual_wan.vwan.id
  address_prefix      = "10.1.0.0/23"
}
resource "azurerm_virtual_network" "east_vnet" {
  name                = "vnet-east"
  location            = var.east_region
  resource_group_name = "rg-project-delta"
  address_space       = ["10.10.0.0/16"]
}
resource "azurerm_virtual_network" "west_vnet" {
  name                = "vnet-west"
  location            = var.west_region
  resource_group_name = "rg-project-delta"
  address_space       = ["10.20.0.0/16"]
}
resource "azurerm_virtual_hub_connection" "east_connection" {
  name                      = "east-vnet-connection"
  virtual_hub_id            = azurerm_virtual_hub.east_hub.id
  remote_virtual_network_id = azurerm_virtual_network.east_vnet.id
}
resource "azurerm_virtual_hub_connection" "west_connection" {
  name                      = "west-vnet-connection"
  virtual_hub_id            = azurerm_virtual_hub.west_hub.id
  remote_virtual_network_id = azurerm_virtual_network.west_vnet.id
}
