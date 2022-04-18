# Weight-tracker-app-Terraform

<p align="center">
  <img 
    width="480"
    height="240"
    src="https://user-images.githubusercontent.com/21116260/160275382-d8fb5785-b728-48bb-ae3f-6fd8d02133b6.png"
  >
</p>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>  
    <li><a href="#Project Overiew">Project Overiew</a></li>
    <li><a href="#Main Components">Main Components</a></li>
    <li><a href="Details">Details</a></li>
    <li><a href="#Providers">Providers</a></li>
    <li><a href="#Modules">Modules</a></li>
    <li><a href="#Modules">Resources</a></li>
    <li><a href="#Modules">Inputs</a></li>
    <li><a href="#Modules">Outputs</a></li>
  </ol>
</details>


# Project Overiew
This project creates the infrastructure of the WeightTracker application in an automated way via terraform.



## Main Components:
* Load Balancer
* Auto Scalable, High Available Web Server
* Managed Flexible PostgresQL DB Server
* Virtual Network with 2 Security Zones


<p align="center">
  <img 
    width="500"
    height="686"
    src="https://user-images.githubusercontent.com/21116260/160275086-92c2e70b-81b0-4e23-abc6-cddab8eb8386.png"
  >
</p>

## Details
The infrastructure Consists of a High available, auto-Scalable Elastic webserver connected to a PaaS postgreSQL server.

it was built with maximum security in mind.

the Webserver can be accessed via SSH only by the Script's author and it isn't accessible to others.
the script gets the author's external ip and configures the appropriate Paramaters in runtime in order to achieve it.

the DB Server can be accessed only inside the inner network.
The Credentials required are stored in a password file, which is sent to the admins
# Weight-tracker-app-Terraform

<p align="center">
  <img 
    width="480"
    height="240"
    src="https://user-images.githubusercontent.com/21116260/160275382-d8fb5785-b728-48bb-ae3f-6fd8d02133b6.png"
  >
</p>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>  
    <li><a href="#Project Overiew">Project Overiew</a></li>
    <li><a href="#Main Components">Main Components</a></li>
    <li><a href="Details">Details</a></li>
    <li><a href="#Providers">Providers</a></li>
    <li><a href="#Modules">Modules</a></li>
    <li><a href="#Modules">Resources</a></li>
    <li><a href="#Modules">Inputs</a></li>
    <li><a href="#Modules">Outputs</a></li>
  </ol>
</details>


# Project Overiew
This project creates the infrastructure of the WeightTracker application in an automated way via terraform.



## Main Components:
* Load Balancer
* Auto Scalable, High Available Web Server
* Managed Flexible PostgresQL DB Server
* Virtual Network with 2 Security Zones


<p align="center">
  <img 
    width="500"
    height="686"
    src="https://user-images.githubusercontent.com/21116260/160275086-92c2e70b-81b0-4e23-abc6-cddab8eb8386.png"
  >
</p>

## Details
The infrastructure Consists of a High available, auto-Scalable Elastic webserver connected to a PaaS postgreSQL server.

it was built with maximum security in mind.

the Webserver can be accessed via SSH only by the Script's author and it isn't accessible to others.
the script gets the author's external ip and configures the appropriate Paramaters in runtime in order to achieve it.

the DB Server can be accessed only inside the inner network.
The Credentials required are stored in a password file, which is sent to the admins

# Weight-tracker-app-Terraform

<p align="center">
  <img 
    width="480"
    height="240"
    src="https://user-images.githubusercontent.com/21116260/160275382-d8fb5785-b728-48bb-ae3f-6fd8d02133b6.png"
  >
</p>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>  
    <li><a href="#Project Overiew">Project Overiew</a></li>
    <li><a href="#Main Components">Main Components</a></li>
    <li><a href="Details">Details</a></li>
    <li><a href="#Providers">Providers</a></li>
    <li><a href="#Modules">Modules</a></li>
    <li><a href="#Modules">Resources</a></li>
    <li><a href="#Modules">Inputs</a></li>
    <li><a href="#Modules">Outputs</a></li>
  </ol>
</details>


# Project Overiew
This project creates the infrastructure of the WeightTracker application in an automated way via terraform.



## Main Components:
* Load Balancer
* Auto Scalable, High Available Web Server
* Managed Flexible PostgresQL DB Server
* Virtual Network with 2 Security Zones


<p align="center">
  <img 
    width="500"
    height="686"
    src="https://user-images.githubusercontent.com/21116260/160275086-92c2e70b-81b0-4e23-abc6-cddab8eb8386.png"
  >
</p>

## Details
The infrastructure Consists of a High available, auto-Scalable Elastic webserver connected to a PaaS postgreSQL server.

it was built with maximum security in mind.

the Webserver can be accessed via SSH only by the Script's author and it isn't accessible to others.
the script gets the author's external ip and configures the appropriate Paramaters in runtime in order to achieve it.

the DB Server can be accessed only inside the inner network.
The Credentials required are stored in a password file, which is sent to the admins

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |
| <a name="provider_http"></a> [http](#provider\_http) | 2.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_Create_Networking_resource_group"></a> [Create\_Networking\_resource\_group](#module\_Create\_Networking\_resource\_group) | ./Modules/RG/ | n/a |
| <a name="module_Create_managed_psql_DB_resource_group"></a> [Create\_managed\_psql\_DB\_resource\_group](#module\_Create\_managed\_psql\_DB\_resource\_group) | ./Modules/RG/ | n/a |
| <a name="module_Create_postgresql_flexible_server"></a> [Create\_postgresql\_flexible\_server](#module\_Create\_postgresql\_flexible\_server) | ./Modules/Managed_psql_db_server/ | n/a |
| <a name="module_Create_virtual_Network"></a> [Create\_virtual\_Network](#module\_Create\_virtual\_Network) | ./Modules/Vnet | n/a |
| <a name="module_Create_vmss_resource_group"></a> [Create\_vmss\_resource\_group](#module\_Create\_vmss\_resource\_group) | ./Modules/RG/ | n/a |
| <a name="module_create_Scale_set_VMSS"></a> [create\_Scale\_set\_VMSS](#module\_create\_Scale\_set\_VMSS) | ./modules/vmss/ | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.lbe_vmss](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.lbe_address_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.lbe_probe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.rule_lbe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.nsg_private_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.nsg_public_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.PublicIPForLB](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.pip-vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet.snet_private_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.snet_public_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.private_subnet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.public_subnet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [http_http.icanhazip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_administrator_password"></a> [db\_administrator\_password](#input\_db\_administrator\_password) | DB Administrator Password | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | DB Administrator Username | `any` | n/a | yes |
| <a name="input_fault_domains"></a> [fault\_domains](#input\_fault\_domains) | Fault Domains | `number` | n/a | yes |
| <a name="input_instances"></a> [instances](#input\_instances) | VM Instance | `number` | n/a | yes |
| <a name="input_public_vm_password"></a> [public\_vm\_password](#input\_public\_vm\_password) | Control Node Password | `string` | n/a | yes |
| <a name="input_public_vm_username"></a> [public\_vm\_username](#input\_public\_vm\_username) | Control Node username | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Project's region | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Control Node VM username | `string` | n/a | yes |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | Condrol Node VM Password | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_password"></a> [vm\_password](#output\_vm\_password) | Control Node Password |
| <a name="output_vmss_password"></a> [vmss\_password](#output\_vmss\_password) | Agents password |
