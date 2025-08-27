resource "azurerm_resource_group" "rgnarendra2" {
  name     = "rgnarendra2"
  location = "East US"
}

resource "azurerm_virtual_network" "virtual_network" {
  depends_on = [ azurerm_resource_group.rgnarendra2 ]
  name                = "vn-aman"
  resource_group_name  = azurerm_resource_group.rgnarendra2.name
  location            = azurerm_resource_group.rgnarendra2.location
  address_space       = ["10.0.0.0/16"]
}