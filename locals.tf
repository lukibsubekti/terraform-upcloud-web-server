locals {
  default_storage_sizes = {
    "DEV-1xCPU-1GB-10GB" = 10
    "DEV-1xCPU-1GB" = 20
    "DEV-1xCPU-2GB" = 30
    "DEV-1xCPU-4GB" = 40
    "DEV-2xCPU-4GB" = 60
    "DEV-2xCPU-8GB" = 80
    "DEV-2xCPU-16GB" = 100

    "1xCPU-1GB" = 25
    "1xCPU-2GB" = 50
    "2xCPU-2GB" = 60
    "2xCPU-4GB" = 80
    "4xCPU-8GB" = 160

    "HIMEM-2xCPU-8GB" = 100
    "HIMEM-2xCPU-16GB" = 100
    "HIMEM-4xCPU-32GB" = 100
  }

  os_names = {
    "ubuntu-24.04" = "Ubuntu Server 24.04 LTS (Noble Numbat)"
    "ubuntu-22.04" = "Ubuntu Server 22.04 LTS (Jammy Jellyfish)"
    "ubuntu-20.04" = "Ubuntu Server 20.04 LTS (Focal Fossa)"
  }
}