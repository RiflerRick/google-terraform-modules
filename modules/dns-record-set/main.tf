resource "google_dns_record_set" "default" {
  name = "${var.subdomain}.${var.dns_name}"
  type = var.record_type
  ttl  = var.ttl
  project = var.project_id

  managed_zone = var.managed_zone_name

  rrdatas = length(var.rrdatas) > 0 ? var.rrdatas : null
  dynamic "routing_policy" {
      for_each = length(var.geo_routing_policies) > 0 ? [var.geo_routing_policies] : []
      content {
          dynamic "geo" {
              for_each = routing_policy.value
              content {
                  location = geo.value.location
                  rrdatas = geo.value.rrdatas
              }
          }
      }
  }
  dynamic "routing_policy" {
      for_each = length(var.wrr_routing_policies) > 0 ? [var.wrr_routing_policies] : []
      content {
          dynamic "wrr" {
              for_each = routing_policy.value
              content {
                  weight = wrr.value.weight
                  rrdatas = wrr.value.rrdatas
              }
          }
      }
  }
}