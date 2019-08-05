provider "azurerm" {
  # Can also use `ARM_CLIENT_ID` environment variable for `client_id`, `ARM_CLIENT_SECRET` for `client_secret`,
  # `ARM_SUBSCRIPTION_ID` for `subscription_id` and `ARM_TENANT_ID` for `tenant_id`
  #client_id = ""
  #client_secret = ""
  #subscription_id = ""
  #tenant_id = ""
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.env_prefix}-resources"
  location = var.location
}

resource "azurerm_app_service_plan" "mywebapp" {
  name                = "${var.env_prefix}-AppServicePlan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "mywebapp" {
  name                = "${var.env_prefix}-MyWebApp-AppService"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.mywebapp.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    default_documents        = ["hostingstart.html", "index.html"]
  }
}

#region Custom hostname demo part 3
/*
provider "cloudflare" {}

resource "cloudflare_record" "mywebapp_awverify" {
  domain  = "ashleypoole.co.uk"
  name    = "awverify.${var.env_prefix}"
  value   = "awverify.${azurerm_app_service.mywebapp.default_site_hostname}"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "mywebapp" {
  domain  = "ashleypoole.co.uk"
  name    = var.env_prefix
  value   = azurerm_app_service.mywebapp.default_site_hostname
  type    = "CNAME"
  proxied = true
  # Explain as dependency is not visible to Terraform we need to explictly reference it using `depends_on`
  depends_on = [cloudflare_record.mywebapp_awverify]
}

resource "azurerm_app_service_custom_hostname_binding" "mywebapp" {
  # Explain we need link this to the cloudflare record output for both removing duplication and to trigger the 
  # dependency tree to cause the external DNS to be created first.
  hostname            = "${cloudflare_record.mywebapp.name}.${cloudflare_record.mywebapp.domain}"
  app_service_name    = azurerm_app_service.mywebapp.name
  resource_group_name = azurerm_resource_group.rg.name
}
*/
#endregion


#region New Relic monitor part 4
/*provider "newrelic" {}

resource "newrelic_synthetics_monitor" "mywebapp" {
  name = "${var.env_prefix} MyWebApp"
  type = "SIMPLE"
  frequency = 1
  status = "ENABLED"
  locations = ["AWS_AP_NORTHEAST_1"]
  uri = "https://${cloudflare_record.mywebapp.name}.${cloudflare_record.mywebapp.domain}"
  depends_on = [azurerm_app_service_custom_hostname_binding.mywebapp]
}
*/
#endregion
