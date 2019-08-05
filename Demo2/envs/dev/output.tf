output "mysampleapp_url" {
  value = module.my_sample_application.app_service_source_control_clone_repo_url
}

output "mysampleapp_repo_url" {
  value = module.my_sample_application.app_service_custom_url
}

output "myotherapp_url" {
  value = module.my_other_application.app_service_source_control_clone_repo_url
}

output "myotherapp_repo_url" {
  value = module.my_other_application.app_service_custom_url
}

