location = "southeastasia"
resource_group_name = "test-nic-rg-001"
public_integration_snet_name = "public-integration-snet-001"
subnet_delegation_001 = {
  name    = "Microsoft.Web/serverFarms"
  actions = "Microsoft.Network/virtualNetworks/subnets/action"
}
vnet_001_address_space = ["10.0.0.0/16"]

dns_servers = [ "value"]

  edge_zone     = var.edge_zone
  auxiliary_mode                 = var.auxiliary_mode
  auxiliary_sku                  = var.auxiliary_sku
  ip_forwarding_enabled          = var.ip_forwarding_enabled
  accelerated_networking_enabled = var.accelerated_networking_enabled
  internal_dns_name_label        = var.internal_dns_name_label