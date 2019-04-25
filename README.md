# Terraform Demo

By Ashley Poole

## Welcome To Terraform

This repository contains the demo's used in my talk on introducing Terraform to developers. This repository contains two demos which are writtern using Terraform 0.11, and makes use of resources for Azure, Cloudflare and New Relic.

### Demo Setup

First install Terraform. Intructions can be found [here](https://learn.hashicorp.com/terraform/getting-started/install.html).

Before running any of the demos, you will be required to run `./SetupDemoVariables.ps1` to setup the required environment vairables. For Demo 1 and Demo 2, you will need supply Azure Secrets ([generate Azure secrets](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html)), retrieve your Cloudflare API key, and generate/retrieve your New Relic Admin API key.

For Demo 3, you will also be required to supply your DigitalOcean API token. If you don't wish to use demo 3, simply enter "null" when prompted for that value. More information can be found in the README within the Demo3 directory.

### Demo 1

Demo 1 will demostrate how to use the basics of Terraform and using Azure, Cloudflare and New Relic providers. Using these providers we will build an Azure App Service with a custom hostname using Cloudflare for external DNS management and security, and then finally add a monitor for the URL using New Relic.

### Demo 2

Demo 2 will demostrate how to take the code produced in demo 2 and refactor it to introduce the Don't Repeat Yourself (DRY) concept by using Terraform modules. This will also demostrate how to easily add another envrionment without much duplication.

### Demo 3

Demo 3 will demostrate a simple example of using a provisioner in combination with the DigitalOcean provider to spin up and configure a Droplet (virtal machine).