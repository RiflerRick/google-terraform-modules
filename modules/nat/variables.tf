
variable "name" {
    type = string
    description = "name of the NAT"
}

variable "router_name" {
    type = string
    description = "name of the cloud router the NAT should be associated with"
}

variable "region" {
    type = string
    description = "region of the NAT"
}

variable "nat_ip_allocate_option" {
    type = string
    description = "How external IPs should be allocated for this NAT. Valid values are AUTO_ONLY for only allowing NAT IPs allocated by Google Cloud Platform, or MANUAL_ONLY for only user-allocated NAT IP addresses. Possible values are MANUAL_ONLY and AUTO_ONLY"
    default = "AUTO_ONLY"
}

variable "source_subnetwork_ip_ranges_to_nat" {
    type = string
    description = "How NAT should be configured per Subnetwork. If ALL_SUBNETWORKS_ALL_IP_RANGES, all of the IP ranges in every Subnetwork are allowed to Nat. If ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, all of the primary IP ranges in every Subnetwork are allowed to Nat. LIST_OF_SUBNETWORKS: A list of Subnetworks are allowed to Nat (specified in the field subnetwork below). Note that if this field contains ALL_SUBNETWORKS_ALL_IP_RANGES or ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, then there should not be any other RouterNat section in any Router for this network in this region. Possible values are ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, and LIST_OF_SUBNETWORKS"
    default = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

variable "nat_ips" {
    type = list(string)
    description = "Self-links of NAT IPs. Only valid if natIpAllocateOption is set to MANUAL_ONLY"
    default = []
}

variable "subnetworks" {
    type = list(object({
        self_link = string
        source_ip_ranges_to_nat = list(string)
        secondary_ip_range_names =list(string)  
    }))
    default = []
    description = "The subnetwork block supports: \nself_link - (Required) Self-link of subnetwork to NAT; \nsource_ip_ranges_to_nat - (Required) List of options for which source IPs in the subnetwork should have NAT enabled. Supported values include: ALL_IP_RANGES, LIST_OF_SECONDARY_IP_RANGES, PRIMARY_IP_RANGE;\nsecondary_ip_range_names - (Optional) List of the secondary ranges of the subnetwork that are allowed to use NAT. This can be populated only if LIST_OF_SECONDARY_IP_RANGES is one of the values in sourceIpRangesToNat"
}
variable "project_id" {
    type = string
    description = "project id"
}