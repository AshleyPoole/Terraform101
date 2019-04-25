# Demo 3 Readme

This is a simple demo of using the provisioner remote-exec to execution commands on virutal machines created using Terraform. In this example, we will install Ngnix.

In this demo, we will be using DigitalOcean Droplets. New users of DigitalOcean can also get $100 free credit as well.

## Windows Setup Notes

If you don't already have a SSH private/public key setup, and uploaded into DigitalOcean, follow these instructions to [generate a key on Windows](https://www.digitalocean.com/docs/droplets/how-to/add-ssh-keys/create-with-putty/) and [uploading your key](https://www.digitalocean.com/docs/droplets/how-to/add-ssh-keys/to-account/). Once uploaded, take note of your SSH key ID within DigitalOcean and add it to `terraform.tfvars` file.

Download and run [Pageant by Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/), open the app, choose "add keys" and browse to your private key. Done, you should now be ready for the demo.

## Linux

This demo hasn't been tested on a Linux machine, so the `connection` information within `main.tf` by setting `agent` to `false` and adding `private_key` attribute, setting it's value to your private key content - can also use `file()` function to read the content from disk.

## Commands

Once the `terraform.tfvars` file is populated with the ssh key ID, you can run the below commands to run the demo.

```powershell
terraform init

# Apply the infrastracture changes and auto approve them, bypassing the need to confirm the changes before execution
terraform apply -auto-approve
```

If successfully, you should see an output as follows containing your droplet IP address: `webserver_ipv4_address = XXX.XXX.XXX.XXX`.

If you browse that IP address, you should see the Ngnix page. This will demostrate a package that isn't in the base image has been installed.

We can now destroy the droplet as we're finished.

```powershell
terraform destroy -auto-approve
```