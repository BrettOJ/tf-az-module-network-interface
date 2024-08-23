
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
    }))
  }))
  description = "(Required) Specifies the Number of nic resouces to be created ."
}

variable "dns_servers" {
  type    = list(string)
  default = null
}

variable "subnet_id" {
  type        = string
  description = "specify the subnet id for the nic"
}

variable "naming_convention_info" {
  description = "(Required) Specify the naming convention information to the resource."
  # type = object({
  #   name         = string
  #   agency_code  = string
  #   project_code = string
  #   env          = string
  #   zone         = string
  #   tier         = string
  # })
}

variable "tags" {
  type        = map(string)
  description = "Specify the tags to the resource. Additional tags will be appended based on the convention"
}

variable "dependencies" {
  type        = list
  description = "List of dependecies modules or resources"
  default     = null
}

variable "enable_ip_forwarding" {
  type    = bool
  default = false
}

variable "vnet_001_address_space" {
  type        = list(string)
  description = "The address space of the virtual network"
  
}
