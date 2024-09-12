provider "azurerm" {
  subscription_id = "f4271ee4-c913-4d2e-b833-7c509d41a2e4"
  features {}
}

resource "azurerm_resource_group" "EHH" {
  name     = "KK-terraform-EHH"
  location = "West Europe"
}

resource "azurerm_network_security_group" "EHH" {
  name                = "KK-terraform-SecurityGroup1"
  location            = azurerm_resource_group.EHH.location
  resource_group_name = azurerm_resource_group.EHH.name
}

resource "azurerm_virtual_network" "EHH" {
  name                = "KK-vnet-prod"
  location            = azurerm_resource_group.EHH.location
  resource_group_name = azurerm_resource_group.EHH.name
  address_space       = ["192.168.1.0/24"]
  dns_servers         = ["192.168.1.10"]

  tags = {
    environment = "Production"
  }
}
