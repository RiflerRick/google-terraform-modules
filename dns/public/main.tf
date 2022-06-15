resource "google_dns_managed_zone" "private-zone" {
  name        = var.name
  dns_name    = var.dns_name
  visibility = "public"
  project = var.project_id
}