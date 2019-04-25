variable "environment_name" {}
variable "web_app_name" {}
variable "web_app_tld" {}

variable "azure_resource_group_name" {}
variable "azure_app_service_plan_tier" {
    default = "Basic"
}
variable "azure_app_service_plan_size" {
    default = "B1"
}

variable "newrelic_monitoring_locations" {
    type = "list"
    default = ["AWS_EU_WEST_2"]
}