resource "azurerm_public_ip" "public_ip" {
  name                = "aman-public_ip"
  location            = azurerm_resource_group.rgnarendra2.location
  resource_group_name = azurerm_resource_group.rgnarendra2.name
  allocation_method   = "Static"
}
