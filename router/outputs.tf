output "name" {
    value = var.name
} 

output "network" {
    value = var.network
}

output "self_link" {
    value = google_compute_router.default.self_link
}

output "id" {
    value = google_compute_router.default.id
}