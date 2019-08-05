# You can either configure providers inside of modules or configure at the root and let modules use already defined providers.
# Can also add alias to providers if multiple configurations are required.

provider "azurerm" {
  # Can also use `ARM_CLIENT_ID` environment variable for `client_id`, `ARM_CLIENT_SECRET` for `client_secret`,
  # `ARM_SUBSCRIPTION_ID` for `subscription_id` and `ARM_TENANT_ID` for `tenant_id`
  #client_id = "${var.azure_client_id}"
  #client_secret = "${var.azure_client_secret}"
  #subscription_id = "${var.azure_subscription_id}"
  #tenant_id = "${var.azure_tenant_id}"
  version = "1.27.0"
}

provider "cloudflare" {
  # Can also use `CLOUDFLARE_EMAIL` environment variable for `email`, `CLOUDFLARE_TOKEN` for `token`
  # and `CLOUDFLARE_ORG_ID` for org_id
  #email = "${var.cloudflare_email}"          
  #token = "${var.cloudflare_token}"
  #org_id = "${var.cloudflare_org_id}"
  version = "1.15.0"
}

provider "newrelic" {
  # Can also use `NEWRELIC_API_KEY` environment variable for `api_key`
  #api_key = "${var.newrelic_api_key}"
  version = "1.5.0"
}

