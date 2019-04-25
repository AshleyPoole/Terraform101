output "app_service_name" {
  value = "${azurerm_app_service.mywebapp.name}"
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.mywebapp.default_site_hostname}"
}

output "app_service_source_control_branch" {
  value = "${azurerm_app_service.mywebapp.source_control.0.branch}"
}

output "app_service_source_control_clone_repo_url" {
  value = "https://${azurerm_app_service.mywebapp.site_credential.0.username}:${azurerm_app_service.mywebapp.site_credential.0.password}@${replace(azurerm_app_service.mywebapp.source_control.0.repo_url, "https://", "")}/${azurerm_app_service.mywebapp.name}.git"
}