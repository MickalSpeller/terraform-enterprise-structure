resource "azurerm_resource_group" "resource_group_infrastructure_state" { 
  name     = "rg-project-delta"
  location = "eastus"
}
moved {
  from = azurerm_resource_group.resource_group_infrastructure_state
  to   = azurerm_resource_group.rg-infra
}