# Creates The WEB Server Network-security-group
resource "azurerm_network_security_group" "nsg_public_subnet" {
  name                = local.nsg_public_subnet
  location            = var.region
  resource_group_name = module.Create_Networking_resource_group.name

  # Allow SSH from your external ip *ONLY* to the web server
  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = local.external_ip
    destination_address_prefix = "*"
  }

  # Allow HTTP Connection for everyone to the web server
  security_rule {
    name                       = "AllowPort8080"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
#
#  security_rule {
#    name                       = "DenyAllInBound"
#    priority                   = 102
#    direction                  = "Inbound"
#    access                     = "Deny"
#    protocol                   = "*"
#    source_port_range          = "*"
#    destination_port_range     = "*"
#    source_address_prefix      = "*"
#    destination_address_prefix = "*"
#  }
}

# Creates The DB Server Network-security-group
resource "azurerm_network_security_group" "nsg_private_subnet" {
  name                = local.nsg_private_subnet
  resource_group_name = module.Create_Networking_resource_group.name
  location            = var.region
  #  depends_on = [azurerm_resource_group.rg_networking]

  security_rule {
    name                       = "AllowPort5432"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*" # Think about it
    destination_port_range     = "5432"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

    security_rule {
      name                       = "DenyAllInBound"
      priority                   = 102
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }


resource "azurerm_subnet_network_security_group_association" "public_subnet_nsg" {
  subnet_id                 = azurerm_subnet.snet_public_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg_public_subnet.id
}

resource "azurerm_subnet_network_security_group_association" "private_subnet_nsg" {
  subnet_id                 = azurerm_subnet.snet_private_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg_private_subnet.id
}

