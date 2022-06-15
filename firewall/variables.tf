variable "name" {
  type        = string
  description = "Name of firewall rule"
}

variable "network" {
    type = string
    description = "network the firewall rule should belong to"
}

variable "source_tags" {
    type  = list(string)
    description = "source tags"
    default = []
}

variable "source_service_accounts" {
    type  = list(string)
    description = "source service accounts, it is a best practice to use source service accounts rather than source tags"
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