data "azurerm_resource_group" "webapp" {
  name = var.azure_resource_group_name
}

resource "azurerm_app_service_plan" "webapp" {
  name                = "${var.environment_name}-${var.web_app_name}-AppServicePlan"
  location            = data.azurerm_resource_group.webapp.location
  resource_group_name = data.azurerm_resource_group.webapp.name

  sku {
    tier = var.azure_app_service_plan_tier
    size = var.azure_app_service_plan_size
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "${var.environment_name}-${var.web_app_name}"
  location            = data.azurerm_resource_group.webapp.location
  resource_group_name = data.azurerm_resource_group.webapp.name
  app_service_plan_id = azurerm_app_service_plan.webapp.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type = "LocalGit"
    default_documents = ["hostingstart.html", "index.html"]
  }
}

resource "azurerm_app_service_custom_hostname_binding" "webapp" {
  hostname            = "${cloudflare_record.webapp.name}.${cloudflare_record.webapp.domain}"
  app_service_name    = azurerm_app_service.webapp.name
  resource_group_name = data.azurerm_resource_group.webapp.name
}

resource "cloudflare_record" "webapp_awverify" {
  domain  = var.web_app_tld
  name    = "awverify.${var.environment_name}-${var.web_app_name}"
  value   = "awverify.${azurerm_app_service.webapp.default_site_hostname}"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "webapp" {
  domain  = cloudflare_record.webapp_awverify.domain
  name    = "${var.environment_name}-${var.web_app_name}"
  value   = azurerm_app_service.webapp.default_site_hostname
  type    = "CNAME"
  proxied = true
  depends_on = [cloudflare_record.webapp_awverify]
}

resource "newrelic_synthetics_monitor" "webapp" {
  name = "${var.environment_name} ${var.web_app_name}"
  type = "SIMPLE"
  frequency = 1
  status = "ENABLED"
  locations = var.newrelic_monitoring_locations
  uri = "https://${cloudflare_record.webapp.name}.${cloudflare_record.webapp.domain}"
  # There's no output from azurerm_app_service_custom_hostname_binding resource other than ID so cannot reference that in the properties.
  # So must manually tell Terraform about the dependency/ordering using `depends_on`.
  depends_on = [azurerm_app_service_custom_hostname_binding.webapp] 
}