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
    type        = map
    default     = {
      name    = "Microsoft.Web/serverFarms"
      actions = "Microsoft.Network/virtualNetworks/subnets/action"
    }
  
}