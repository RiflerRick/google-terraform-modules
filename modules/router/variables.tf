variable "name" {
  type        = string
  description = "Name of the router"
}

variable "network_name" {
    type = string
    description = "network name the router should go into"
}

variable "region" {
    type = string
    description = "region in which to create the router"
}

variable "advertise_all_subnets" {
    default = true
    description = "true if you want to advertise all subnets in the region, false will not advertise any subnet, default is true"
}

variable "bgp_asn" {
    default = -1
    description = "bgp asn, only required if advertise_all_subnets is set to true"
}

variable "project_id" {
    type = string
    description = "project id"
}