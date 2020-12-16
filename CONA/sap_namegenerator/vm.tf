locals {

  db_oscode     = upper(var.db_ostype) == "LINUX" ? "l" : "w"
  app_oscode    = upper(var.app_ostype) == "LINUX" ? "l" : "w"
  anchor_oscode = upper(var.anchor_ostype) == "LINUX" ? "l" : "w"

  anchor_computer_names = [for idx in range(length(local.zones)) :
    format("%sanchorz%s%02d%s%s", lower(var.sap_sid), local.zones[idx % max(length(local.zones), 1)], idx + var.resource_offset, local.anchor_oscode, local.random_id_vm_verified)
  ]

  anchor_vm_names = [for idx in range(length(local.zones)) :
    format("%sanchor_z%s_%02d%s%s", lower(var.sap_sid), local.zones[idx % max(length(local.zones), 1)], idx + var.resource_offset, local.anchor_oscode, local.random_id_vm_verified)
  ]

  deployer_vm_names = [for idx in range(var.deployer_vm_count) :
    format("a%s%s%st%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
  ]

  anydb_computer_names = [for idx in range(var.db_server_count) :
    format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
  ]

  anydb_computer_names_ha = [for idx in range(var.db_server_count) :
    format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
  ]

  anydb_vm_names = [for idx in range(var.db_server_count) :
    length(var.db_zones) > 0 ? (
      format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)) : (
      format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
    )
  ]

  anydb_vm_names_ha = [for idx in range(var.db_server_count) :
    length(var.db_zones) > 0 ? (
      format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)) : (
      format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
    )
  ]

  app_computer_names = [for idx in range(var.app_server_count) :
    format("a%s%s%sa%03d", local.app_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
  ]

  app_server_vm_names = [for idx in range(var.app_server_count) :
    length(var.app_zones) > 0 ? (
      format("a%s%s%sa%03d", local.app_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)) : (
      format("a%s%s%sa%03d", local.app_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
    )
  ]

  iscsi_server_names = [for idx in range(var.iscsi_server_count) :
    lower(format("%s%s%siscsi%02d", lower(local.env_verified), local.sap_vnet_verified, local.location_short, idx))
  ]

  hana_computer_names = [for idx in range(var.db_server_count) :
    format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
  ]

  hana_computer_names_ha = [for idx in range(var.db_server_count) :
    format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
  ]

  hana_server_vm_names = [for idx in range(var.db_server_count) :
    length(var.db_zones) > 0 ? (
      // TODO Update to reflect zonal naming
      format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)) : (
      format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
    )
  ]

  hana_server_vm_names_ha = [for idx in range(var.db_server_count) :
    length(var.db_zones) > 0 ? (
      // TODO Update to reflect zonal naming
      format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)) : (
      format("a%s%s%sd%03d", local.db_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
    )
  ]

  scs_computer_names = [for idx in range(var.scs_server_count) :
    format("a%s%s%sc%03d", local.app_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
  ]

  scs_server_vm_names = [for idx in range(var.scs_server_count) :
    length(var.scs_zones) > 0 ? (
      format("a%s%s%sc%03d", local.app_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)) : (
      format("a%s%s%sc%03d", local.app_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
    )
  ]

  web_computer_names = [for idx in range(var.web_server_count) :
    format("a%s%s%sw%03d", local.app_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
  ]

  web_server_vm_names = [for idx in range(var.web_server_count) :
    length(var.web_zones) > 0 ? (
      format("a%s%s%sw%03d", local.app_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)) : (
      format("a%s%s%sw%03d", local.app_oscode, lower(local.env_verified), var.codename, idx + var.resource_offset)
    )
  ]

  observer_computer_names = [for idx in range(length(local.zones)) :
    format("%sobserver%02d%s%s", lower(var.sap_sid), idx + var.resource_offset, local.db_oscode, local.random_id_vm_verified)
  ]

  observer_vm_names = [for idx in range(length(local.zones)) :
    local.zonal_deployment ? (
      format("%sobserver_z%s_%02d%s%s", lower(var.sap_sid), local.zones[idx % length(local.zones)], idx + var.resource_offset, local.db_oscode, local.random_id_vm_verified)) : (
      format("%sobserver%02d%s%s", lower(var.sap_sid), idx + var.resource_offset, local.db_oscode, local.random_id_vm_verified)
    )
  ]

  //For customer who want to have an alternative name for the second IP address
  app_secondary_dnsnames = [for idx in range(var.app_server_count) :
    format("%sapp%02d%s%s", lower(var.sap_sid), idx + var.resource_offset, local.app_oscode, local.random_id_vm_verified)
  ]

  anchor_secondary_dnsnames = [for idx in range(length(local.zones)) :
    format("%sanchorz%s%02d%s%s", lower(var.sap_sid), local.zones[idx % max(length(local.zones), 1)], idx + var.resource_offset, local.anchor_oscode, local.random_id_vm_verified)
  ]

  anydb_secondary_dnsnames = [for idx in range(var.db_server_count) :
    format("%sd%s%02dl%d%s", lower(var.sap_sid), lower(var.db_sid), idx + var.resource_offset, 0, local.random_id_vm_verified)
  ]

  anydb_secondary_dnsnames_ha = [for idx in range(var.db_server_count) :
    format("%sd%s%02dl%d%s", lower(var.sap_sid), lower(var.db_sid), idx + var.resource_offset, 1, local.random_id_vm_verified)
  ]

  hana_secondary_dnsnames = [for idx in range(var.db_server_count) :
    format("%sd%s%02dl%d%s", lower(var.sap_sid), lower(var.db_sid), idx + var.resource_offset, 0, local.random_id_vm_verified)
  ]

  hana_secondary_dnsnames_ha = [for idx in range(var.db_server_count) :
    format("%sd%s%02dl%d%s", lower(var.sap_sid), lower(var.db_sid), idx + var.resource_offset, 1, local.random_id_vm_verified)
  ]

  scs_secondary_dnsnames = [for idx in range(var.scs_server_count) :
    format("%sscs%02d%s%s", lower(var.sap_sid), idx + var.resource_offset, local.app_oscode, local.random_id_vm_verified)
  ]

  web_secondary_dnsnames = [for idx in range(var.web_server_count) :
    format("%sweb%02d%s%s", lower(var.sap_sid), idx + var.resource_offset, local.app_oscode, local.random_id_vm_verified)
  ]

}
