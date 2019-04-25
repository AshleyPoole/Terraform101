locals {
  environment_name = "PROD"
  azure_app_service_plan_tier = "Basic"
  azure_app_service_plan_size = "B1"
}

module "shared" {
  source = "../../modules/shared"
  environment_name = "${local.environment_name}"
  azure_resource_location = "${var.azure_location}"
}

module "my_sample_application" {
  source = "../../modules/webapp"
  azure_resource_group_name = "${module.shared.azure_resource_group_name}"
  azure_app_service_plan_tier = "${local.azure_app_service_plan_tier}"
  azure_app_service_plan_size = "${local.azure_app_service_plan_size}"
  environment_name = "${local.environment_name}"
  web_app_name = "mysampleapp"
  web_app_tld = "${var.top_level_domain}"
}

module "my_other_application" {
  source = "../../modules/webapp"
  azure_resource_group_name = "${module.shared.azure_resource_group_name}"
  azure_app_service_plan_tier = "${local.azure_app_service_plan_tier}"
  azure_app_service_plan_size = "${local.azure_app_service_plan_size}"
  environment_name = "${local.environment_name}"
  web_app_name = "myotherapp"
  web_app_tld = "${var.top_level_domain}"
}