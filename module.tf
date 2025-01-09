resource "azurerm_network_interface" "nic_obj" {
  lifecycle {
    ignore_changes = [tags]
  }
  for_each                       = var.instances == null ? {} : var.instances
  name                           = lookup(module.nic_name.naming_convention_output, each.key).names.0
  location                       = var.location
  resource_group_name            = var.resource_group_name
  dns_servers                    = var.dns_servers
  edge_zone                      = var.edge_zone
  auxiliary_mode                 = var.auxiliary_mode
  auxiliary_sku                  = var.auxiliary_sku
  ip_forwarding_enabled          = var.ip_forwarding_enabled
  accelerated_networking_enabled = var.accelerated_networking_enabled
  internal_dns_name_label        = var.internal_dns_name_label

  dynamic "ip_configuration" {
    for_each = each.value.ip_config
    content {
      name                                               = lookup(module.ipconfig_name.naming_convention_output, format("%s_%s", each.key, ip_configuration.key)).names.0
      subnet_id                                          = ip_configuration.value.subnet_id
      primary                                            = ip_configuration.value.is_primary
      private_ip_address_allocation                      = ip_configuration.value.private_ip_address == null ? "Dynamic" : "Static"
      public_ip_address_id                               = ip_configuration.value.public_ip_address_id == null ? null : ip_configuration.value.public_ip_address_id
      private_ip_address                                 = ip_configuration.value.private_ip_address == null ? null : ip_configuration.value.private_ip_address
      gateway_load_balancer_frontend_ip_configuration_id = ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id == null ? null : ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id
      private_ip_address_version                         = ip_configuration.value.private_ip_address_version == null ? null : ip_configuration.value.private_ip_address_version
    }
  }
  depends_on = [var.dependencies]
  tags       = lookup(module.nic_name.naming_convention_output, each.key).tags.0
}
