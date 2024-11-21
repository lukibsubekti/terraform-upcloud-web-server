variable "zone" {
  description = "Network zone"
  type        = string
}

variable "hostname" {
  description = "Server hostname"
  type        = string
}

variable "plan" {
  description = "Server plan"
  type        = string
}

variable "os" {
  description = "Operating system code name"
  type        = string
  default     = "ubuntu-22.04"
  validation {
    condition     = contains(keys(local.os_names), var.os)
    error_message = "Invalid OS code name"
  }
}

variable "storage_size" {
  description = "Storage size in GB"
  type        = number
  default     = null
}

variable "simple_backup" {
  description = "Enable simple backup. Plan can be one of: daily, dailies, weeklies, monthlies. Time in hhmm format."
  type = object({
    plan = string
    time = string
  })
  default = null
}

variable "private_network" {
  description = "Details of private network"
  type = object({
    network_id          = string
    family              = optional(string)
    ip_address          = optional(string)
    source_ip_filtering = optional(bool)
  })
  default = null
}

variable "login" {
  description = "Operating system login details"
  type = object({
    user          = optional(string, "root")
    keys          = optional(list(string), null)
    send_password = optional(string, "email")
  })
  default = {
    user          = "root",
    keys          = null,
    send_password = "email"
  }
  validation {
    condition     = contains(["none", "email", "sms"], var.login.send_password)
    error_message = "Invalid send_password value. Select one of: none, email, sms"
  }
}

variable "labels" {
  description = "Server labels"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "URL or content of user data"
  type        = string
  default     = null
}

variable "user_data_template" {
  description = "Template of user data"
  type        = string
  default     = null
  validation {
    condition     = var.user_data_template == null || contains(local.user_data_templates, (var.user_data_template == null ? "" : var.user_data_template))
    error_message = "Invalid user_data_template value. Select one of: ubuntu_docker"
  }
}