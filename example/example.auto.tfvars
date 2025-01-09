location                     = "southeastasia"
resource_group_name          = "test-nic-rg-001"
public_integration_snet_name = "public-integration-snet-001"
subnet_delegation_001 = {
  name    = "Microsoft.Web/serverFarms"
  actions = "Microsoft.Network/virtualNetworks/subnets/action"
}
vnet_001_address_space = ["10.0.0.0/16"]

dns_servers = null

edge_zone                      = null
auxiliary_mode                 = null
auxiliary_sku                  = null
ip_forwarding_enabled          = false
accelerated_networking_enabled = true
internal_dns_name_label        = null