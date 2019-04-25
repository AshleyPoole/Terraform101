output "app_service_source_control_clone_repo_url" {
  value = "https://${azurerm_app_service.webapp.site_credential.0.username}:${azurerm_app_service.webapp.site_credential.0.password}@${replace(azurerm_app_service.webapp.source_control.0.repo_url, "https://", "")}/${azurerm_app_service.webapp.name}.git"
}

output "app_service_custom_url" {
  value = "https://${cloudflare_record.webapp.name}.${cloudflare_record.webapp.domain}"
}