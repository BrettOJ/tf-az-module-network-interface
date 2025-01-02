Manages a Network Interface.

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#example-usage)

```hcl
resource "azurerm_resource_group" "example" { name = "example-resources" location = "West Europe" } resource "azurerm_virtual_network" "example" { name = "example-network" address_space = ["10.0.0.0/16"] location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name } resource "azurerm_subnet" "example" { name = "internal" resource_group_name = azurerm_resource_group.example.name virtual_network_name = azurerm_virtual_network.example.name address_prefixes = ["10.0.2.0/24"] } resource "azurerm_network_interface" "example" { name = "example-nic" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name ip_configuration { name = "internal" subnet_id = azurerm_subnet.example.id private_ip_address_allocation = "Dynamic" } }
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#argument-reference)

The following arguments are supported:

-   [`ip_configuration`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#ip_configuration-1) - (Required) One or more `ip_configuration` blocks as defined below.
    
-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#location-1) - (Required) The location where the Network Interface should exist. Changing this forces a new resource to be created.
    
-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#name-1) - (Required) The name of the Network Interface. Changing this forces a new resource to be created.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#resource_group_name-1) - (Required) The name of the Resource Group in which to create the Network Interface. Changing this forces a new resource to be created.
    

___

-   [`auxiliary_mode`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#auxiliary_mode-1) - (Optional) Specifies the auxiliary mode used to enable network high-performance feature on Network Virtual Appliances (NVAs). This feature offers competitive performance in Connections Per Second (CPS) optimization, along with improvements to handling large amounts of simultaneous connections. Possible values are `AcceleratedConnections`, `Floating`, `MaxConnections` and `None`.

-   [`auxiliary_sku`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#auxiliary_sku-1) - (Optional) Specifies the SKU used for the network high-performance feature on Network Virtual Appliances (NVAs). Possible values are `A8`, `A4`, `A1`, `A2` and `None`.

-   [`dns_servers`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#dns_servers-1) - (Optional) A list of IP Addresses defining the DNS Servers which should be used for this Network Interface.

-   [`edge_zone`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#edge_zone-1) - (Optional) Specifies the Edge Zone within the Azure Region where this Network Interface should exist. Changing this forces a new Network Interface to be created.
    
-   [`ip_forwarding_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#ip_forwarding_enabled-1) - (Optional) Should IP Forwarding be enabled? Defaults to `false`.
    
-   [`accelerated_networking_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#accelerated_networking_enabled-1) - (Optional) Should Accelerated Networking be enabled? Defaults to `false`.
    

-   [`internal_dns_name_label`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#internal_dns_name_label-1) - (Optional) The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network.
    
-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#tags-1) - (Optional) A mapping of tags to assign to the resource.
    

___

The `ip_configuration` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#name-2) - (Required) A name used for this IP Configuration.
    
-   [`gateway_load_balancer_frontend_ip_configuration_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#gateway_load_balancer_frontend_ip_configuration_id-1) - (Optional) The Frontend IP Configuration ID of a Gateway SKU Load Balancer.
    
-   [`subnet_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#subnet_id-1) - (Optional) The ID of the Subnet where this Network Interface should be located in.
    

-   [`private_ip_address_version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#private_ip_address_version-1) - (Optional) The IP Version to use. Possible values are `IPv4` or `IPv6`. Defaults to `IPv4`.
    
-   [`private_ip_address_allocation`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#private_ip_address_allocation-1) - (Required) The allocation method used for the Private IP Address. Possible values are `Dynamic` and `Static`.
    

-   [`public_ip_address_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#public_ip_address_id-1) - (Optional) Reference to a Public IP Address to associate with this NIC
    
-   [`primary`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#primary-1) - (Optional) Is this the Primary IP Configuration? Must be `true` for the first `ip_configuration` when multiple are specified. Defaults to `false`.
    

When `private_ip_address_allocation` is set to `Static` the following fields can be configured:

-   [`private_ip_address`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#private_ip_address-1) - (Optional) The Static IP Address which should be used.

When `private_ip_address_version` is set to `IPv4` the following fields can be configured:

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`applied_dns_servers`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#applied_dns_servers-1) - If the Virtual Machine using this Network Interface is part of an Availability Set, then this list will have the union of all DNS servers from all Network Interfaces that are part of the Availability Set.
    
-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#id-1) - The ID of the Network Interface.
    
-   [`internal_domain_name_suffix`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#internal_domain_name_suffix-1) - Even if `internal_dns_name_label` is not specified, a DNS entry is created for the primary NIC of the VM. This DNS name can be constructed by concatenating the VM name with the value of `internal_domain_name_suffix`.
    
-   [`mac_address`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#mac_address-1) - The Media Access Control (MAC) Address of the Network Interface.
    
-   [`private_ip_address`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#private_ip_address-2) - The first private IP address of the network interface.
    

-   [`private_ip_addresses`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#private_ip_addresses-1) - The private IP addresses of the network interface.

-   [`virtual_machine_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#virtual_machine_id-1) - The ID of the Virtual Machine which this Network Interface is connected to.

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#create-1) - (Defaults to 30 minutes) Used when creating the Network Interface.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#update-1) - (Defaults to 30 minutes) Used when updating the Network Interface.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#read-1) - (Defaults to 5 minutes) Used when retrieving the Network Interface.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#delete-1) - (Defaults to 30 minutes) Used when deleting the Network Interface.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#import)

Network Interfaces can be imported using the `resource id`, e.g.

```shell
terraform import azurerm_network_interface.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/networkInterfaces/nic1
```