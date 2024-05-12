terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.103.1"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "tonybrg" {
   name     = "terraform-rg"
   location = "UK South"
 }

resource "azurerm_virtual_network" "tonybvnet" {
   name                = "terraform-vnet"
   address_space       = ["10.0.0.0/16"]
   location            = azurerm_resource_group.tonybrg.location
   resource_group_name = azurerm_resource_group.tonybrg.name
 }

resource "azurerm_subnet" "tonybsubnet" {
   name                 = "terraform-subnet"
   resource_group_name  = azurerm_resource_group.tonybrg.name
   virtual_network_name = azurerm_virtual_network.tonybvnet.name
   address_prefixes     = ["10.0.2.0/24"]
 }