module "nic_name" {
  source      = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  name_format = "res_type|env|zone|tier|name|instance"
  naming_convention_info = {
    for key, value in var.instances :
    "${key}" => {
      name_info = merge(var.naming_convention_info, {
        start_index = value.index
      })
      tags = var.tags
    }
  }
  resource_type = "nic"
}

locals {
  # nic_info = var.instances == null ? {} : var.instances
  arr_nics = flatten([for k, v in var.instances : [
    for ipk, ipv in v.ip_config : {
      nic_key      = k
      ipconfig_key = ipk
      nic_index    = v.index
    }]
  ])

  nic_info = { for k, v in local.arr_nics : format("%s_%s", v.nic_key, v.ipconfig_key) => v }

}

module "ipconfig_name" {
  source      = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  name_format = "res_type|-|env|-|zone|-|tier|-|name|-|instance"
  naming_convention_info = {
    for key, value in local.nic_info :
    "${key}" => {
      name_info = merge(var.naming_convention_info, {
        name        = value.ipconfig_key
        start_index = value.nic_index
      })
      tags = var.tags
    }
  }
  resource_type = "ipcf"
}
