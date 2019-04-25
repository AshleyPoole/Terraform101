# Demo 1 Readme

## Session Commands

### Part one

```powershell
terraform plan # Observe message about missing module as requires running init first

terraform init

terraform apply

start {app_service_default_hostname} # Get the value of "{app_service_default_hostname}" from the output of running `terraform apply` above

# Observe Azure up & running page
```

### Part two

let's now add our own content. In this example just a basic html page but could be a compiled ASP.NET Core application.

```powershell
git clone {app_service_source_control_clone_repo_url} .\app

cd .\app

git init # As it's a empty repo we've cloned

cp ..\index.html .

git add .

git commit -m "Adding index.html"

git push origin master

# Observe deployment and open index.html page
```

### Part three

Let's now add an external DNS record on Cloudflare so that recieved its performance and security features and setup a custom hostname.

Within `main.tf`, find `#region Custom hostname demo part 3` and uncomment the code in that block.

```powershell
terraform init

terraform apply

# Note sometimes DNS creation hasn't replicated before Azure tries to query the DNS, so may need to run apply twice in this case
```

Observe the new hostname is now availabile and behind Cloudflare's protection and speed.

### Part four

Within `main.tf`, find `#region New Relic monitor part 4` and uncomment the code in that block.

```powershell
terraform init

terraform apply

# Show New Relic monitor
```