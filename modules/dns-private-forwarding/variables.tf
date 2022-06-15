variable "name" {
    type = string
    description = "name of the dns managed zone"
}

variable "project_id" {
    type = string
}

variable "dns_name" {
    type = string
    description = "dns name"
}

variable "network_self_links" {
    type = list(string)
    description = "network self links of the networks that will have visbility of this managed zone"
}

variable "forwarding_target_name_servers" {
    type = list(string)
    description = "forwarding target name servers' IPv4 address"
}
