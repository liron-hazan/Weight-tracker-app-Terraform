
# Creat Control Node Virtual Machine


module "Create_A_VM" {
  source = "./Modules/VM"
  name                            = local.vm
  resource_group_name             = local.rg-vmss
  location                        = var.region
  size                            = var.sku
  admin_username                  = var.public_vm_username
  admin_password                  = var.public_vm_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.network_interface.id,]
}