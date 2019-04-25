resource "azurerm_resource_group" "rg" {
  name     = "${var.environment_name}-resources"
  location = "${var.azure_resource_location}"
}