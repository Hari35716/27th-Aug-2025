resource "azurerm_network_interface" "nic" {
  name                = "aman-nic"
  location            = azurerm_resource_group.rgnarendra2.location
  resource_group_name = azurerm_resource_group.rgnarendra2.name

  ip_configuration {
    name                          = "aman-ip"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-aman"
  location            = azurerm_resource_group.rgnarendra2.location
  resource_group_name = azurerm_resource_group.rgnarendra2.name
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]
  size = "Standard_B1s"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version = "latest"
  }
    admin_username                  = "hari35716"
  disable_password_authentication = false   # 🔹 Password auth enabled
  admin_password                  = "MySecurePass@123"   # 🔹 Apna strong password yahan do

}

# Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = "aman-nsg"
  location            = azurerm_resource_group.rgnarendra2.location
  resource_group_name = azurerm_resource_group.rgnarendra2.name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = ""     # yahan "" ka matlab hai sabko allow, aap apna IP bhi daal sakte ho
    destination_address_prefix = "*"
  }
}
# Associate NSG with NIC
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}