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
resource "azurerm_subnet" "snet-01" {
  name                 = "snet-01"
  resource_group_name  = azurerm_resource_group.rg-infra.name
  virtual_network_name = azurerm_virtual_network.vnet-hub01.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_linux_virtual_machine" "vm01" {
  name                = "vm01"
  resource_group_name = azurerm_resource_group.rg-infra.name
  location            = azurerm_resource_group.rg-infra.location
  size                = "Standard_F2"
  admin_username      = "labadministrator"
  admin_password = variable.admin_password
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}
resource "azurerm_network_interface" "vm-nic-01" {
  name                = "vm-nic-01"
  location            = azurerm_resource_group.rg-infra.location
  resource_group_name = azurerm_resource_group.rg-infra.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet-01.id
    private_ip_address_allocation = "Dynamic"
  }
}
