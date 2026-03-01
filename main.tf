resource "azurerm_resource_group" "rg-infra" { 
  name     = "rg-project-delta"
  location = "eastus"
}
moved {
  from = azurerm_resource_group.resource_group_infrastructure_state
  to   = azurerm_resource_group.rg-infra
}
module "vWan" {
  source              = "./modules/vwan"
  resource_group_name = azurerm_resource_group.rg-infra.name
  east_region        = "eastus"
  west_region        = "westus"
}

