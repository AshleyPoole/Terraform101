param(
    [Parameter(Mandatory=$true)]
    [string]$AzureClientId,
    [Parameter(Mandatory=$true)]
    [string]$AzureClientSecret,
    [Parameter(Mandatory=$true)]
    [string]$AzureSubscriptionId,
    [Parameter(Mandatory=$true)]
    [string]$AzureTenantId,
    [Parameter(Mandatory=$true)]
    [string]$CloudflareEmail,
    [Parameter(Mandatory=$true)]
    [string]$CloudflareToken,
    [Parameter(Mandatory=$true)]
    [string]$CloudflareOrganisationId,
    [Parameter(Mandatory=$true)]
    [string]$NewRelicApiKey,
    [Parameter(Mandatory=$true)]
    [string]$DigitalOceanApiKey
)

# Azure Provider ENV Variable Setup
[System.Environment]::SetEnvironmentVariable('ARM_CLIENT_ID', $AzureClientId, 'user')
$ENV:ARM_CLIENT_ID = $AzureClientId
[System.Environment]::SetEnvironmentVariable('ARM_CLIENT_SECRET', $AzureClientSecret, 'user')
$ENV:ARM_CLIENT_SECRET = $AzureClientSecret
[System.Environment]::SetEnvironmentVariable('ARM_SUBSCRIPTION_ID', $AzureSubscriptionId, 'user')
$ENV:ARM_SUBSCRIPTION_ID = $AzureSubscriptionId
[System.Environment]::SetEnvironmentVariable('ARM_TENANT_ID', $AzureTenantId, 'user')
$ENV:ARM_TENANT_ID = $AzureTenantId

# Cloudflare Provider ENV Variable Setup
[System.Environment]::SetEnvironmentVariable('CLOUDFLARE_EMAIL', $CloudflareEmail, 'user')
$ENV:CLOUDFLARE_EMAIL = $CloudflareEmail
[System.Environment]::SetEnvironmentVariable('CLOUDFLARE_TOKEN', $CloudflareToken, 'user')
$ENV:CLOUDFLARE_TOKEN = $CloudflareToken
[System.Environment]::SetEnvironmentVariable('CLOUDFLARE_ORG_ID', $CloudflareOrganisationId, 'user')
$ENV:CLOUDFLARE_ORG_ID = $CloudflareOrganisationId

# New Relic Provider ENV Variable Setup
[System.Environment]::SetEnvironmentVariable('NEWRELIC_API_KEY', $NewRelicApiKey, 'user')
$ENV:NEWRELIC_API_KEY = $NewRelicApiKey

# DigitalOcean Provider ENV Variable Setup
[System.Environment]::SetEnvironmentVariable('DIGITALOCEAN_TOKEN', $DigitalOceanApiKey, 'user')
$ENV:DIGITALOCEAN_TOKEN = $DigitalOceanApiKey
