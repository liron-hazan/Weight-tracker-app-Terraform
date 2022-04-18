#output vm_password{
#  description = "Control Node Password"
#  value = "Control node VM password: ${module.create_Scale_set_VMSS.vm_password}"
#  sensitive = true
#}

#output vmss_password{
#  description = "Agents password"
#  value = "Agents VM Password: ${module.create_Scale_set_VMSS.vm_password}"
#  sensitive = true
#}