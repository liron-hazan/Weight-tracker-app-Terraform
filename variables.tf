# Region for various services
locals {
    db                 = "psql-db-${terraform.workspace}"
    dns_zone_vnet_link = "pdsnz-net-link-${terraform.workspace}"
    nsg_public_subnet  = "nsg-public-subnet-${terraform.workspace}"
    nsg_private_subnet = "nsg-private-subnet-${terraform.workspace}"
    private_dns_zone   = "pdnsz-dns-zone-${terraform.workspace}"
    private_subnet     = "snet-private-subnet-${terraform.workspace}"
    public_subnet      = "snet-public-subnet-${terraform.workspace}"
    vm                 = "vm-${terraform.workspace}"
    vmss               = "vmss-web-${terraform.workspace}"
    vnet               = "vnet-${terraform.workspace}"
    vmss_public_ip     = "Public-Ip-Prefix-vmss-${terraform.workspace}"

    rg_db              = "rg-psql-flexible-managed-db-${terraform.workspace}"
    rg-networking      = "rg-networking-${terraform.workspace}"
    rg-vmss            = "rg-vmss-${terraform.workspace}"

    publicIPForLB      =  "PublicIPForLB-${terraform.workspace}"
    lbe_vmss           =  "lbe_vmss-${terraform.workspace}"
    lbe_address_pool   =  "BackEndAddressPool-${terraform.workspace}"
    lbe_probe          =  "Health-Probe-1-${terraform.workspace}"
    rule_lbe           =  "LBRule-${terraform.workspace}"
    frontend_ip_configuration = "frontend-PublicIPAddress-${terraform.workspace}"
}


variable "region" {
  description = "Project's region"
  type        = string
  }


variable "username" {
  description   = "Control Node VM username"
  type          = string
}

#Uncomment this for Password prompt when applying
variable "vm_password" {
  description   = "Condrol Node VM Password"
  type          = string
  sensitive     = true
}

variable "db_username" {
  description   = "DB Administrator Username"
  sensitive     = true
}

variable "db_administrator_password" {
  description   = "DB Administrator Password"
  type          = string
  sensitive     = true
}

#Get External ip from http://icanhazip.com
data "http" "icanhazip" {
  url           = "http://icanhazip.com"
}

locals {
  description   = "external-ip from https://icanhazip.com/"
  external_ip   = chomp(data.http.icanhazip.body)
}

variable "instances" {
  description   = "VM Instance"
  type          = number
}

variable "fault_domains" {
  description   = "Fault Domains"
  type = number
}

variable "sku" {
  description   = "SKU"
  type          = string
}

variable "public_vm_username" {
  description = "Control Node username"
  type = string
}

variable "public_vm_password" {
  description = "Control Node Password"
  type        = string
}