resource "google_compute_router" "default" {
  name    = var.name
  network = var.network_name
  region = var.region
  project = var.project_id
  dynamic "bgp" {
    for_each = var.advertise_all_subnets ? [1] : []
    content {
        asn = var.bgp_asn
        advertise_mode    = "DEFAULT"
    }
    
  }
}