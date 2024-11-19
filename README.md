# Terraform - UpCloud - Web Server


## About
A Terraform module for web server creation in UpCloud.
The server will be attached to utility and public network by default.


## Requirements
- Terraform version `>= 1.6.0`
- UpCloud Provider version `>= 5.10.0`


## Examples

### A minimal setup

```hcl
provider "upcloud" {
  username = var.upcloud_username
  password = var.upcloud_password
}

module "web_server" {
  source  = "lukibsubekti/web-server/upcloud"
  version = "1.0.0"

  zone = "sg-sin1"
  hostname = "development.website"
  plan = "DEV-1xCPU-4GB"
}
```

### Configure OS and user data

```hcl
module "web_server" {
  source  = "lukibsubekti/web-server/upcloud"
  version = "1.0.0"

  zone = "sg-sin1"
  hostname = "development.website"
  plan = "2xCPU-2GB"

  os = "ubuntu-24.04"
  user_data_template = "ubuntu_docker"
}
```

### Attach to private network

```hcl
module "web_server" {
  source  = "lukibsubekti/web-server/upcloud"
  version = "1.0.0"

  zone = "sg-sin1"
  hostname = "development.website"
  plan = "HIMEM-2xCPU-8GB"
  
  private_network {
    network_id = "xxxxx"
    address = "10.0.0.123"
  }
}
```

### Login using SSH keys

```hcl
module "web_server" {
  source  = "lukibsubekti/web-server/upcloud"
  version = "1.0.0"

  zone = "sg-sin1"
  hostname = "development.website"
  plan = "DEV-1xCPU-4GB"
  
  login = {
    send_password = "none"
    keys = [
      "pubkey-xxx",
      "pubkey-yyy"
    ]
  }
}
```