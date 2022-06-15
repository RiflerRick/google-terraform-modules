resource "google_dns_managed_zone" "private-zone" {
  name        = var.name
  dns_name    = var.dns_name
  visibility = "private"
  project = var.project_id

  dynamic "private_visibility_config" {
      for_each = length(var.network_self_links) > 1 ? [var.network_self_links[0]] : var.network_self_links
      content {
        dynamic "networks" {
            for_each = var.network_self_links
            content {
                network_url = networks.value
            }
            
        }
      }
  }
  dynamic "forwarding_config" {
    for_each = length(var.forwarding_target_name_servers) > 1 ? [var.forwarding_target_name_servers[0]] : var.forwarding_target_name_servers
    content {
        dynamic "target_name_servers" {
            for_each = var.forwarding_target_name_servers
            content {
                ipv4_address = target_name_servers.value
            }
        }
    }
    }
}