# Creates a virtual network
module "Create_virtual_Network"{
  source                = "./Modules/Vnet"
  name                  = local.vnet
  resource_group_name   = module.Create_Networking_resource_group.name
  location              = var.region
  address_space         = ["10.0.0.0/16"]
}

# Creates a Public subnet
resource "azurerm_subnet" "snet_public_subnet" {
  name                  = local.public_subnet
  resource_group_name   = module.Create_Networking_resource_group.name
  virtual_network_name  = module.Create_virtual_Network.name #var.name.vnet
  address_prefixes      = ["10.0.1.0/24"]
#  depends_on = [azurerm_resource_group.rg_networking]
}

# Creates a Private subnet
resource "azurerm_subnet" "snet_private_subnet" {
  name                 = local.private_subnet # Private Subnet
  resource_group_name  = module.Create_Networking_resource_group.name
  virtual_network_name = module.Create_virtual_Network.name #var.name.vnet
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
   delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action",]
    }
  }
}

# create a nic for single vm
resource "azurerm_network_interface" "network_interface" {
  name                = "nic"
  location            = var.region
  resource_group_name = local.rg-networking

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet_public_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip-vm.id
  }
}
# create public ip for single vm
resource "azurerm_public_ip" "pip-vm" {
  name                    = "Public_ip_vm"
  resource_group_name     = module.Create_Networking_resource_group.name
  location                = var.region
  allocation_method       = "Static"
  sku  = "Standard"
  tags = {
    environment = "Production"
  }
}
