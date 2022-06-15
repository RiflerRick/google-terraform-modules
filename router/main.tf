resource "google_compute_router" "default" {
  name    = var.name
  network = var.network
  region = var.region
  project = var.project_id
  dynamic "bgp" {
    for_each = var.bgp.asn == -1 ? [] : [var.bgp]
    content {
        asn = bgp.value.asn
        advertise_mode    = bgp.value.advertise_mode
        advertised_groups = bgp.value.advertised_groups
        dynamic "advertised_ip_ranges" {
            for_each = bgp.value.advertised_ip_ranges
            content {
                range = advertised_ip_ranges.value.range
            }
        }
    }
    
  }
}