
output "id" {
    value = google_dns_managed_zone.private-zone.id
}

output "managed_zone_name" {
    value = var.name
}

output "dns_name" {
    value = var.dns_name
}
