
resource "upcloud_server" "main" {
  zone     = var.zone
  hostname = var.hostname
  plan     = var.plan

  template {
    storage                  = local.os_names[var.os]
    size                     = var.storage_size != null ? var.storage_size : lookup(local.default_storage_sizes, var.plan, 0)
    filesystem_autoresize    = true
    delete_autoresize_backup = true
  }

  dynamic "simple_backup" {
    for_each = var.simple_backup != null ? [var.simple_backup] : []
    content {
      plan = simple_backup.value.plan
      time = simple_backup.value.time
    }
  }

  network_interface {
    type = "utility"
  }

  network_interface {
    type = "public"
  }

  dynamic "network_interface" {
    for_each = var.private_network != null ? [var.private_network] : []
    content {
      type                = "private"
      network             = network_interface.value.network_id
      ip_address_family   = network_interface.value.family
      ip_address          = network_interface.value.ip_address
      source_ip_filtering = network_interface.value.source_ip_filtering
    }
  }

  login {
    user              = var.login.user
    keys              = var.login.keys
    create_password   = var.login.send_password == "none" ? false : true
    password_delivery = var.login.send_password
  }

  # to prevent error: "Metadata must be enabled when cloning a cloud-init template", type="METADATA_DISABLED_ON_CLOUD-INIT"
  metadata = true

  labels = var.labels

  # can be done only by "main account" 
  # tags = [ "pedka", "dev" ]

  # provisioning
  user_data = (
    var.user_data != null ? var.user_data :
    var.user_data_template != null ? templatefile("${path.module}/user_data_templates/${var.user_data_template}.tftpl", {}) : null
  )
}
