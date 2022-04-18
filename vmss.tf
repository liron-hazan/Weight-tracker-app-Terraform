
 # Creates a Scale-set VM
module "create_Scale_set_VMSS"{
  source                          = "./modules/vmss/"
  name                            = local.vmss
  resource_group_name             = local.rg-vmss
  sku                             = var.sku
  region                          = var.region
  instances                       = var.instances
  fault_domains                   = var.fault_domains

  username                        = var.username
  password                        = var.vm_password

  subnet                          = azurerm_subnet.snet_public_subnet.id
  load_balancer_backend_address   = [azurerm_lb_backend_address_pool.lbe_address_pool.id]
}