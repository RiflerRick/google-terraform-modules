variable "name" {
  type        = string
  description = "Name of firewall rule"
}

variable "network" {
    type = string
    description = "network the firewall rule should belong to"
}

variable "target_tags" {
    type  = list(string)
    description = "target tags"
    default = []
}

variable "target_service_accounts" {
    type  = list(string)
    description = "target service accounts, it is a best practice to use target service accounts rather than target tags"
    default = []
}

variable "firewall_rules_allow" {
    type = map(object({
        protocol = string   
        ports = list(string)
    }))
    description = "Rules that this firewall rule should contain"
    default = {}
}

variable "firewall_rules_deny" {
    type = map(object({
        protocol = string   
        ports = list(string)
    }))
    description = "Rules that this firewall rule should contain"
    default = {}
}

variable "source_ranges" {
    type = list(string)
    description = "source ranges"
}

variable "project_id" {
    type = string
    description = "project id"
}