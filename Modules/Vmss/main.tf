# Originally Written in 25.03.2022
# This module was Created By Liron Hazan
# Support: liron.hazan@gmail.com

terraform {
  required_version =  ">= 1"
}


#Creates WEB Linux Virtual Machine Scale Set
resource "azurerm_linux_virtual_machine_scale_set" "vmss-web-server" {
  name                        = var.name # WEB Server Virtual Machine
  resource_group_name         = var.resource_group_name
  location                    = var.region
  instances                   = var.instances
  sku                         = var.sku
  admin_username              = var.username
  admin_password              = var.password
  platform_fault_domain_count = var.fault_domains
  disable_password_authentication = false
  lifecycle {
    ignore_changes = [instances]
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name          = "vnet-nic01"
    primary       = true

    ip_configuration {
      name        = "publicIp-vnet-nic01"
      primary     = true
      subnet_id   = var.subnet
      load_balancer_backend_address_pool_ids  =  var.load_balancer_backend_address

#      public_ip_address  {
#      name                = "vmss-public_ip"
#      public_ip_prefix_id = var.public_ip_prefix_id_vmss
#      }
    }
  }
}

#
#resource "azurerm_monitor_autoscale_setting" "autoscaling" {
#  name                = "vmss-auto-scaling"
#  resource_group_name = var.resource_group_name
#  location            = var.region
#  target_resource_id  = azurerm_linux_virtual_machine_scale_set.vmss-web-server.id
#  enabled             = true
#
#  profile {
#    name = "defaultProfile"
#
#    capacity {
#      default = var.default_instances
#      minimum = var.minimum_instances
#      maximum = var.maximum_instances
#    }
#
#    rule {
#      metric_trigger {
#        metric_name        = "Percentage CPU"
#        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss-web-server.id
#        time_grain         = "PT1M"
#        statistic          = "Average"
#        time_window        = "PT5M"
#        time_aggregation   = "Average"
#        operator           = "GreaterThan"
#        threshold          = 75
#        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
#        dimensions {
#          name     = "AppName"
#          operator = "Equals"
#          values   = ["App1"]
#        }
#      }
#
#      scale_action {
#        direction = "Increase"
#        type      = "ChangeCount"
#        value     = "1"
#        cooldown  = "PT1M"
#      }
#    }
#
#    rule {
#      metric_trigger {
#        metric_name        = "Percentage CPU"
#        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss-web-server.id
#        time_grain         = "PT1M"
#        statistic          = "Average"
#        time_window        = "PT5M"
#        time_aggregation   = "Average"
#        operator           = "LessThan"
#        threshold          = 25
#      }
#
#      scale_action {
#        direction = "Decrease"
#        type      = "ChangeCount"
#        value     = "1"
#        cooldown  = "PT1M"
#      }
#    }
#  }
#}