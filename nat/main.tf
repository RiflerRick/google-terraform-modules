resource "google_compute_router_nat" "default" {
  name                               = var.name
  project = var.project_id
  router                             = var.router_name
  region                             = var.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

  nat_ips                = var.nat_ips
  dynamic "subnetwork" {
      for_each = var.source_subnetwork_ip_ranges_to_nat == "LIST_OF_SUBNETWORKS" ? var.subnetworks : []
      content {
          name = subnetwork.value.self_link
          source_ip_ranges_to_nat = subnetwork.value.source_ip_ranges_to_nat
          secondary_ip_range_names = subnetwork.value.secondary_ip_range_names
      }
  }
}