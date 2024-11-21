locals {
  default_storage_sizes = {
    "DEV-1xCPU-1GB-10GB" = 10
    "DEV-1xCPU-1GB"      = 20
    "DEV-1xCPU-2GB"      = 30
    "DEV-1xCPU-4GB"      = 40
    "DEV-2xCPU-4GB"      = 60
    "DEV-2xCPU-8GB"      = 80
    "DEV-2xCPU-16GB"     = 100

    "1xCPU-1GB"    = 25
    "1xCPU-2GB"    = 50
    "2xCPU-2GB"    = 60
    "2xCPU-4GB"    = 80
    "4xCPU-8GB"    = 160
    "6xCPU-16GB"   = 320
    "8xCPU-32GB"   = 640
    "12xCPU-48GB"  = 960
    "16xCPU-64GB"  = 1280
    "24xCPU-96GB"  = 1920
    "32xCPU-128GB" = 2048
    "38xCPU-192GB" = 2048
    "48xCPU-256GB" = 2048
    "64xCPU-384GB" = 2048
    "80xCPU-512GB" = 2048

    "HIMEM-2xCPU-8GB"    = 100
    "HIMEM-2xCPU-16GB"   = 100
    "HIMEM-4xCPU-32GB"   = 100
    "HIMEM-4xCPU-64GB"   = 200
    "HIMEM-6xCPU-128GB"  = 300
    "HIMEM-8xCPU-192GB"  = 400
    "HIMEM-12xCPU-256GB" = 500
    "HIMEM-16xCPU-384GB" = 600
    "HIMEM-24xCPU-512GB" = 700

    "HICPU-8xCPU-12GB"   = 100
    "HICPU-8xCPU-16GB"   = 200
    "HICPU-16xCPU-24GB"  = 100
    "HICPU-16xCPU-32GB"  = 200
    "HICPU-32xCPU-48GB"  = 200
    "HICPU-32xCPU-64GB"  = 300
    "HICPU-64xCPU-96GB"  = 200
    "HICPU-64xCPU-128GB" = 300
  }

  os_names = {
    "ubuntu-24.04" = "Ubuntu Server 24.04 LTS (Noble Numbat)"
    "ubuntu-22.04" = "Ubuntu Server 22.04 LTS (Jammy Jellyfish)"
    "ubuntu-20.04" = "Ubuntu Server 20.04 LTS (Focal Fossa)"
  }

  user_data_templates = [
    "ubuntu_docker"
  ]
}