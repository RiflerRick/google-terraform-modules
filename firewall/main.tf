resource "google_compute_firewall" "default" {
  name    = var.name
  network = var.network
  project = var.project_id

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

  target_tags = var.target_service_accounts == [] ? var.target_tags : null
  target_service_accounts = var.target_service_accounts
  source_ranges = var.source_ranges
}