
variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the name of the Resource Group in which the Virtual Machine should exist. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the Azure Region where the Virtual Machine exists. Changing this forces a new resource to be created."
}

variable "instances" {
  type = map(object({
    index = number
    ip_config = map(object({
      public_ip_address_id = string
      is_primary           = bool
      private_ip_address   = string
      gateway_load_balancer_frontend_ip_configuration_id = string
      private_ip_address_version = string
    }))
  }))
  description = "(Required) Specifies the Number of nic resouces to be created ."
}

variable "dns_servers" {
  type    = list(string)
  default = null
}

variable "naming_convention_info" {
  description = "(Required) Specify the naming convention information to the resource."
  type = object({
    name = string
    site = string
    env  = string
    app  = string
  })
}

variable "tags" {
  type        = map(string)
  description = "Specify the tags to the resource. Additional tags will be appended based on the convention"
}

variable "dependencies" {
  type        = list(any)
  description = "List of dependecies modules or resources"
  default     = null
}

variable "ip_forwarding_enabled" {
  type    = bool
  default = false
}

variable "accelerated_networking_enabled" {
  type    = bool
  default = false
}

variable "edge_zone" {
  type    = string
  default = null
}

variable "subnet_id" {
  type        = string
  description = "The id of the subnet"
}

variable "internal_dns_name_label" {
  type    = string
  default = null
}

variable "auxiliary_mode" {
  type    = string
  default = null
}

variable "auxiliary_sku" {
  type    = string
  default = null
}