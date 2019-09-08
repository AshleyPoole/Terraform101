provider "digitalocean" {
  # Can also use `DIGITALOCEAN_TOKEN` environment variable for your API key input
  # token = ""
}

resource "digitalocean_droplet" "webserver" {
  ssh_keys           = var.ssh_keys
  image              = "ubuntu-16-04-x64"
  region             = "LON1"
  size               = "s-1vcpu-1gb"
  private_networking = true
  backups            = true
  ipv6               = true
  name               = "webserver01"

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt-get -y install nginx",
    ]

    connection {
      host    = self.ipv4_address
      type    = "ssh"
      user    = "root"
      agent   = true
      timeout = "2m"
    }
  }
}

