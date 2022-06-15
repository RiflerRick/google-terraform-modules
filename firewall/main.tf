resource "google_compute_firewall" "default" {
  name    = var.name
  network = var.network

  dynamic "allow" {
    for_each = var.firewall_rules_allow
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }

  dynamic "deny" {
    for_each = var.firewall_rules_deny
    content {
      protocol = deny.value.protocol
      ports    = deny.value.ports
    }
  }

  source_tags = var.source_service_accounts == [] ? var.source_tags : null
  source_service_accounts = var.source_service_accounts
}