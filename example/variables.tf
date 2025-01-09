variable "location" {
  description = "The location/region where the resources will be created"
  type        = string
  default     = "southeastasia"

}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "test-nic-rg-001"

}

variable "vnet_001_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
}

variable "public_integration_snet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "public-integration-snet-001"

}

variable "subnet_delegation_001" {
  description = "The subnet delegation"
  type        = map(any)
  default = {
    name    = "Microsoft.Web/serverFarms"
    actions = "Microsoft.Network/virtualNetworks/subnets/action"
  }
}

variable "dns_servers" {
  description = "The DNS servers"
  type        = list(string)
  default     = null
}

variable "edge_zone" {
  description = "The edge zone"
  type        = string
  default     = null
}

variable "auxiliary_mode" {
  description = "The auxiliary mode"
  type        = string
  default     = null
}

variable "auxiliary_sku" {
  description = "The auxiliary sku"
  type        = string
  default     = null
}

variable "ip_forwarding_enabled" {
  description = "The ip forwarding enabled"
  type        = bool
}

variable "accelerated_networking_enabled" {
  description = "The accelerated networking enabled"
  type        = bool
}

variable "internal_dns_name_label" {
  description = "The internal DNS name label"
  type        = string
  default     = null
}

