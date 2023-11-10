provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "nginx_rg" {
  name     = "nginx-rg"
  location = "East US"  # Adjust the location as needed
}

resource "azurerm_virtual_network" "nginx_vnet" {
  name                = "nginx-vnet"
  resource_group_name = azurerm_resource_group.nginx_rg.name
  location            = azurerm_resource_group.nginx_rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "nginx_subnet" {
  name                 = "nginx-subnet"
  resource_group_name  = azurerm_resource_group.nginx_rg.name
  virtual_network_name = azurerm_virtual_network.nginx_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_linux_virtual_machine" "nginx_vm" {
  name                = "nginx-vm"
  location            = azurerm_resource_group.nginx_rg.location
  resource_group_name = azurerm_resource_group.nginx_rg.name

  network_interface_ids = [azurerm_network_interface.nginx_nic.id]

  size = "Standard_B1s"

  admin_username = "adminuser"
  admin_password = "Password1234!"  # Replace with your own secure password

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "nginx_nic" {
  name                = "nginx-nic"
  location            = azurerm_resource_group.nginx_rg.location
  resource_group_name = azurerm_resource_group.nginx_rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.nginx_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
