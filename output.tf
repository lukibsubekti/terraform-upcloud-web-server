output "server_id" {
  description = "Server ID"
  value       = upcloud_server.main.id
}

output "timezone" {
  description = "Server timezone"
  value       = upcloud_server.main.timezone
}

output "networks" {
  description = "Server networks"
  value = {
    "utility" = {
      ip_address = upcloud_server.main.network_interface[0].ip_address
      network_id = upcloud_server.main.network_interface[0].network
    }
    "public" = {
      ip_address = upcloud_server.main.network_interface[1].ip_address
      network_id = upcloud_server.main.network_interface[1].network
    }
    "private" = length(upcloud_server.main.network_interface) == 3 ? {
      ip_address = upcloud_server.main.network_interface[2].ip_address
      network_id = upcloud_server.main.network_interface[2].network
    } : null
  }
}