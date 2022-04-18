module "Create_vmss_resource_group" {
  source    = "./Modules/RG/"
  name      = local.rg-vmss
  region    = var.region
}

module "Create_managed_psql_DB_resource_group"{
  source    = "./Modules/RG/"
  name      = local.rg_db
  region    = var.region
}

module "Create_Networking_resource_group" {
  source    = "./Modules/RG/"
  name      = local.rg-networking
  region    = var.region
}