
locals {
  tags = {
    "created-by" = "Terraform"
  }

  naming_convention_info = {
    site = "tst"
    env  = "env"
    app  = "zone"
    name = "001"
  }
}

module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags                   = local.tags
    }
  }
}

module "virtual_network_001" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-virtual-network?ref=main"
  resource_group_name    = module.resource_groups.rg_output.1.name
  location               = var.location
  address_space          = var.vnet_001_address_space
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags

}

module "vnet_subnets_001" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-network-subnet?ref=main"
  resource_group_name    = module.resource_groups.rg_output.1.name
  virtual_network_name   = module.virtual_network_001.vnets_output.name
  location               = var.location
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags
  create_nsg             = true

  subnets = {
    1 = {
      name                                      = var.public_integration_snet_name
      address_prefixes                          = ["10.0.10.0/24"]
      service_endpoints                         = null
      private_endpoint_network_policies_enabled = null
      route_table_id                            = null
      create_nsg                                = true
      nsg_inbound                               = []
      nsg_outbound                              = []
      delegation                                = null #var.subnet_delegation_001
    }
  }
}

module "nic_obj" {
  source                         = "git::https://github.com/BrettOJ/tf-az-module-network-interface?ref=main"
  location                       = var.location
  resource_group_name            = module.resource_groups.rg_output.1.name
  subnet_id                      = module.vnet_subnets_001.snet_output[1].id
  dns_servers                    = var.dns_servers
  edge_zone                      = var.edge_zone
  auxiliary_mode                 = var.auxiliary_mode
  auxiliary_sku                  = var.auxiliary_sku
  ip_forwarding_enabled          = var.ip_forwarding_enabled
  accelerated_networking_enabled = var.accelerated_networking_enabled
  internal_dns_name_label        = var.internal_dns_name_label
  naming_convention_info         = local.naming_convention_info
  tags                           = local.tags

  instances = {
    nic1 = {
      index = 1
      ip_config = {
        n1 = {
          subnet_id                                          = module.vnet_subnets_001.snet_output[1].id
          is_primary                                         = true
          public_ip_address_id                               = null
          gateway_load_balancer_frontend_ip_configuration_id = null
          private_ip_address_allocation                      = "Static"
          private_ip_address                                 = null
          private_ip_address_version                         = null
        }
      }
    }
  }
}



