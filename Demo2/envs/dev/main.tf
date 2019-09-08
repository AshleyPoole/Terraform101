locals {
  environment_name = "DEV01"
}

module "shared" {
  source                  = "../../modules/shared"
  environment_name        = local.environment_name
  azure_resource_location = var.azure_location
}

module "my_sample_application" {
  source                    = "../../modules/webapp"
  azure_resource_group_name = module.shared.azure_resource_group_name
  environment_name          = local.environment_name
  web_app_name              = "mysampleapp"
  web_app_tld               = var.top_level_domain
}

module "my_other_application" {
  source                    = "../../modules/webapp"
  azure_resource_group_name = module.shared.azure_resource_group_name
  environment_name          = local.environment_name
  web_app_name              = "myotherapp"
  web_app_tld               = var.top_level_domain
}

