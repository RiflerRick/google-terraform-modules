variable "name" {
  type        = string
  description = "Name of firewall rule"
}

variable "network" {
    type = string
    description = "network the firewall rule should belong to"
}

variable "region" {
    type = string
    description = "region in which to create the router"
}

variable "bgp" {
    type = object({
        asn = number
        advertise_mode = string
        advertised_groups = list(string)
        advertised_ip_ranges = list(object({
            range = string
        }))
    })
    description = "Rules that this firewall rule should contain"
    default = {
        asn = -1
        advertise_mode = ""
        advertised_groups = []
        advertised_ip_ranges = [{
            range = ""
        }]
    }
}