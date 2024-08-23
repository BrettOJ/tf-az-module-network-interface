
locals {
  tags = {
    "created-by" = "Terraform"
  }

  naming_convention_info = {
    name         = "001"
    project_code = "nb"
    env          = "dev"
    zone         = "z1"
    agency_code  = "konjur"
    tier         = "dta"
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

module "log_analytics_workspace" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-log-analytics?ref=main"
  resource_group_name    = module.resource_groups.rg_output.1.name
  location               = var.location
  sku                    = "PerGB2018"
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags
  solution_plan_map      = null #local.solution_plan_map 
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

    001 = {
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
  diag_object = {
    log_analytics_workspace_id = module.log_analytics_workspace.loga_output.id
    log = [
      ["AllLogs", true, true, 80],
    ]
    metric = [
      ["AllMetrics", true, true, 80],
    ]
  }
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = var.location
  resource_group_name = module.resource_groups.rg_output.1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.vnet_subnets_001.snet_output.001.id
    private_ip_address_allocation = "Dynamic"
  }
}