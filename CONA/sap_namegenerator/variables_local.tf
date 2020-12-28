
variable environment {
  description = "Environment type (Prod, Test, Sand, QA)"
}

variable library_environment {
  description = "SAP Library environment type (Prod, Test, Sand, QA)"
  default     = ""
}


variable deployer_environment {
  description = "Deployer environment type (Prod, Test, Sand, QA)"
  default     = ""
}

variable landscape_environment {
  description = "Landscape environment type (Prod, Test, Sand, QA)"
  default     = ""
}

variable location {
  description = "Azure region"
}

variable codename {
  description = "Code name of application (optional)"
  default     = ""
}

variable management_vnet_name {
  description = "Name of Management vnet"
  default     = ""
}

variable sap_vnet_name {
  description = "Name of SAP vnet"
  default     = ""
}

variable sap_sid {
  description = "SAP SID"
  default     = ""
}

variable db_sid {
  description = "Database SID"
  default     = ""
}

variable random_id {
  type        = string
  description = "Random hex string"
}

variable db_ostype {
  description = "Database operating system"
  default     = "LINUX"
}

variable app_ostype {
  description = "Application Server operating system"
  default     = "LINUX"
}

variable db_platform {
  description = "AnyDB platform type (Oracle, DB2, SQLServer, ASE)"
  default     = "LINUX"
}

variable anchor_ostype {
  description = "Anchor Server operating system"
  default     = "LINUX"
}

variable app_server_count {
  type    = number
  default = 1
}

variable scs_server_count {
  type    = number
  default = 1
}

variable web_server_count {
  type    = number
  default = 1
}


variable db_server_count {
  type    = number
  default = 1
}

variable iscsi_server_count {
  type    = number
  default = 1
}

variable deployer_vm_count {
  type    = number
  default = 1
}

variable resource_offset {
  type    = number
  default = 0
}

//Todo: Add to documentation
variable sapautomation_name_limits {
  description = "Name length for automation resources"
  default = {
    environment_variable_length = 5
    sap_vnet_length             = 7
    random_id_length            = 3
    sdu_name_length             = 80
  }
}

//Todo: Add to documentation
variable azlimits {
  description = "Name length for resources"
  default = {
    asr         = 50
    aaa         = 50
    acr         = 49
    afw         = 50
    rg          = 80
    kv          = 24
    stgaccnt    = 24
    vnet        = 38
    nsg         = 80
    snet        = 80
    nic         = 80
    vml         = 64
    vmw         = 15
    vm          = 80
    functionapp = 60
    lb          = 80
    lbrule      = 80
    evh         = 50
    la          = 63
    pip         = 80
    peer        = 80
    gen         = 24
  }
}

variable region_mapping {
  type        = map(string)
  description = "Region Mapping: Full = Single CHAR, 4-CHAR"
  # 42 Regions 
  default = {
    "australiacentral"   = "auce"
    "australiacentral2"  = "auc2"
    "australiaeast"      = "auea"
    "australiasoutheast" = "ause"
    "brazilsouth"        = "brso"
    "brazilsoutheast"    = "brse"
    "brazilus"           = "brus"
    "canadacentral"      = "cace"
    "canadaeast"         = "caea"
    "centralindia"       = "cein"
    "centralus"          = "ceus"
    "eastasia"           = "eaas"
    "eastus"             = "eaus"
    "eastus2"            = "eus2"
    "francecentral"      = "frce"
    "francesouth"        = "frso"
    "germanynorth"       = "geno"
    "germanywestcentral" = "gewc"
    "japaneast"          = "jaea"
    "japanwest"          = "jawe"
    "koreacentral"       = "koce"
    "koreasouth"         = "koso"
    "northcentralus"     = "ncus"
    "northeurope"        = "noeu"
    "norwayeast"         = "noea"
    "norwaywest"         = "nowe"
    "southafricanorth"   = "sano"
    "southafricawest"    = "sawe"
    "southcentralus"     = "scus"
    "southeastasia"      = "soea"
    "southindia"         = "soin"
    "switzerlandnorth"   = "swno"
    "switzerlandwest"    = "swwe"
    "uaecentral"         = "uace"
    "uaenorth"           = "uano"
    "uksouth"            = "ukso"
    "ukwest"             = "ukwe"
    "westcentralus"      = "wcus"
    "westeurope"         = "weeu"
    "westindia"          = "wein"
    "westus"             = "weus"
    "westus2"            = "wus2"
  }
}

//Todo: Add to documentation
variable resource_suffixes {
  type        = map(string)
  description = "Extension of resource name"

  default = {
    "admin_nic"           = "-admin-nic"
    "admin_subnet"        = "admin-subnet"
    "admin_subnet_nsg"    = "adminSubnet-nsg"
    "app_alb"             = "lb_[SID]_app_s4hana_[ENVIRONMENT]_westus2_01"
    "app_avset"           = "as_[SID]_app_s4hana_[ENVIRONMENT]_westus2_01"
    "app_subnet"          = "app-subnet"
    "app_subnet_nsg"      = "appSubnet-nsg"
    "db_alb"              = "lb_[SID]_db_s4hana_[ENVIRONMENT]_westus2_01"
    "db_alb_bepool"       = "lb_[SID]_db_s4hana_[ENVIRONMENT]_westus2_01-bePool"
    "db_alb_feip"         = "lb_[SID]_db_s4hana_[ENVIRONMENT]_westus2_01-feip"
    "db_alb_hp"           = "lb_[SID]_db_s4hana_[ENVIRONMENT]_westus2_01-hp"
    "db_alb_rule"         = "lb_[SID]_db_s4hana_[ENVIRONMENT]_westus2_01-rule_"
    "db_avset"            = "as_[SID]_db_s4hana_[ENVIRONMENT]_westus2_01"
    "db_nic"              = "-db-nic"
    "db_subnet"           = "db-subnet"
    "db_subnet_nsg"       = "dbSubnet-nsg"
    "deployer_rg"         = "-INFRASTRUCTURE"
    "deployer_state"      = "_DEPLOYER.terraform.tfstate"
    "deployer_subnet"     = "_deployment-subnet"
    "deployer_subnet_nsg" = "deployment-nsg"
    "iscsi_subnet"        = "iscsi-subnet"
    "iscsi_subnet_nsg"    = "iscsiSubnet-nsg"
    "library_rg"          = "-SAP_LIBRARY"
    "library_state"       = "_SAP-LIBRARY.terraform.tfstate"
    "kv"                  = ""
    "msi"                 = "deployer-msi"
    "nic"                 = "-nic"
    "osdisk"              = "-OsDisk"
    "pip"                 = "-pip"
    "ppg"                 = "ppg_[SID]_s4hana_[ENVIRONMENT]_westus2_01"
    "storage_nic"         = "-storage-nic"
    "storage_subnet"      = "_storage-subnet"
    "storage_subnet_nsg"  = "_storageSubnet-nsg"
    "scs_alb"             = "lb_[SID]_scs_s4hana_[ENVIRONMENT]_westus2_01"
    "scs_alb_bepool"      = "lb_[SID]_scs_s4hana_[ENVIRONMENT]_westus2_01-bePool"
    "scs_alb_feip"        = "lb_[SID]_scs_s4hana_[ENVIRONMENT]_westus2_01-feip"
    "scs_alb_hp"          = "lb_[SID]_scs_s4hana_[ENVIRONMENT]_westus2_01-hp"
    "scs_alb_rule"        = "lb_[SID]_scs_s4hana_[ENVIRONMENT]_westus2_01-rule_"
    "scs_avset"           = "as_[SID]_scs_s4hana_[ENVIRONMENT]_westus2_01"
    "scs_ers_feip"        = "lb_[SID]_ers_s4hana_[ENVIRONMENT]_westus2_01-feip"
    "scs_ers_hp"          = "lb_[SID]_ers_s4hana_[ENVIRONMENT]_westus2_01-hp"
    "scs_ers_rule"        = "lb_[SID]_scsErs_s4hana_[ENVIRONMENT]_westus2_01-rule_"
    "scs_scs_rule"        = "lb_[SID]_scsScs_s4hana_[ENVIRONMENT]_westus2_01-rule_"
    "sdu_rg"              = ""
    "vm"                  = ""
    "vnet"                = "-vnet"
    "vnet_rg"             = "-INFRASTRUCTURE"
    "scs_alb"             = "lb_[SID]_web_s4hana_[ENVIRONMENT]_westus2_01"
    "scs_alb_bepool"      = "lb_[SID]_web_s4hana_[ENVIRONMENT]_westus2_01-bePool"
    "scs_alb_feip"        = "lb_[SID]_web_s4hana_[ENVIRONMENT]_westus2_01-feip"
    "scs_alb_hp"          = "lb_[SID]_web_s4hana_[ENVIRONMENT]_westus2_01-hp"
    "scs_alb_rule"        = "lb_[SID]_web_s4hana_[ENVIRONMENT]_westus2_01-rule_"
    "scs_avset"           = "as_[SID]_web_s4hana_[ENVIRONMENT]_westus2_01"
    "web_subnet"          = "web-subnet"
    "web_subnet_nsg"      = "webSubnet-nsg"

  }
}

variable app_zones {
  type        = list(string)
  description = "List of availability zones for application tier"
  default     = []
}

variable scs_zones {
  type        = list(string)
  description = "List of availability zones for scs tier"
  default     = []
}

variable web_zones {
  type        = list(string)
  description = "List of availability zones for web tier"
  default     = []
}

variable db_zones {
  type        = list(string)
  description = "List of availability zones for db tier"
  default     = []
}

variable custom_prefix {
  type        = string
  description = "Custom prefix"
  default     = ""
}

variable deployer_location {
  description = "Deployer Azure region"
  default     = ""
}

variable "env_mapping" {
  description = "mapping Environment names"
  default = {
    "d" = "dev",
    "t" = "tst",
    "q" = "qa",
    "p" = "prd", 
    "l" ="prf",
    "s" = "sbx"

  }
}

variable "env_mapping_fullname" {
  description = "mapping Environment names"
  default = {
    "d" = "development",
    "t" = "tst",
    "q" = "qa",
    "p" = "prd", 
    "l" ="prf",
    "s" = "sandbox"

  }
}



locals {

  location_short = upper(try(var.region_mapping[var.location], "unkn"))

  deployer_location_short = length(var.deployer_location) > 0 ? upper(try(var.region_mapping[var.deployer_location], "unkn")) : local.location_short

  // If no deployer environment provided use environment
  deployer_environment_temp = length(var.deployer_environment) > 0 ? var.deployer_environment : var.environment

  // If no landscape environment provided use environment
  landscape_environment_temp = length(var.landscape_environment) > 0 ? var.landscape_environment : var.environment

  // If no library environment provided use environment
  library_environment_temp = length(var.library_environment) > 0 ? var.library_environment : var.environment

  deployer_env_verified  = upper(substr(local.deployer_environment_temp, 0, var.sapautomation_name_limits.environment_variable_length))
  env_verified           = upper(substr(var.environment, 0, var.sapautomation_name_limits.environment_variable_length))
  landscape_env_verified = upper(substr(local.landscape_environment_temp, 0, var.sapautomation_name_limits.environment_variable_length))
  library_env_verified   = upper(substr(local.library_environment_temp, 0, var.sapautomation_name_limits.environment_variable_length))

  sap_vnet_verified = replace(upper(trim(substr(var.sap_vnet_name, 0, var.sapautomation_name_limits.sap_vnet_length), "-_")), "/[^A-Za-z0-9]/", "")
  dep_vnet_verified = replace(upper(trim(substr(var.management_vnet_name, 0, var.sapautomation_name_limits.sap_vnet_length), "-_")), "/[^A-Za-z0-9]/", "")

  random_id_verified    = upper(substr(var.random_id, 0, var.sapautomation_name_limits.random_id_length))
  random_id_vm_verified = lower(substr(var.random_id, 0, var.sapautomation_name_limits.random_id_length))

  zones            = distinct(concat(var.db_zones, var.app_zones, var.scs_zones, var.web_zones))
  zonal_deployment = try(length(local.zones), 0) > 0 ? true : false

  //The separator to use between the prefix and resource name
  separator = ""

  env_three_letter = var.env_mapping[var.environment]
  env_fullname = var.env_mapping_fullname[var.environment]

  keys   = keys(var.resource_suffixes)

  fixed_resources = { for idx, keyv in local.keys :
    local.keys[idx] => replace(replace(var.resource_suffixes[keyv], "[SID]", var.sap_sid), "[ENVIRONMENT]", local.env_fullname)

  }

}

