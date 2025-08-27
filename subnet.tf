
resource "azurerm_subnet" "subnet" {
  depends_on = [ azurerm_virtual_network.virtual_network ]
  name                 = "subnet-aman"
  resource_group_name  = azurerm_resource_group.rgnarendra2.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["10.0.1.0/24"]
}