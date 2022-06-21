
variable "dns_name" {
    type = string
    description = "dns name"
}

variable "subdomain" {
    type = string
    description = "record subdomain, the subdomain is added to the dns_name"
}

variable "record_type" {
    type = string
    description = "The DNS record set type"
    default = "A"
}

variable "ttl" {
    type = number
    description = "The time-to-live of this record set (seconds)"
    default = 300
}

variable "project_id" {
    type = string
    description = "project id the record set will be placed in"
}

variable "managed_zone_name" {
    type = string
    description = "managed_zone_name the record set will be placed in"
}

variable "rrdatas" {
    type = list(string)
    description = "The string data for the records in this record set whose meaning depends on the DNS type. For TXT record, if the string data contains spaces, add surrounding \" if you don't want your string to get split on spaces. To specify a single record value longer than 255 characters such as a TXT record for DKIM, add \" \" inside the Terraform configuration string (e.g. \"first255characters\" \"morecharacters\")"
    default = []
}

variable "routing_policies" {
    type = object({
        geo_routing_policies = list(object({
            location = string
            rrdatas = list(string)
        }))
        wrr_routing_policies = list(object({
            weight = string
            rrdatas = list(string)
        }))
    })
    default = {
        geo_routing_policies = []
        wrr_routing_policies = []
    }
    description = "The configuration for steering traffic based on query. Now you can specify either Weighted Round Robin(WRR) type or Geolocation(GEO) type"
}