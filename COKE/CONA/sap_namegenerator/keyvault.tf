locals {

  sdu_private_keyvault_name = substr(replace(lower(format("kv-prm-%s-%s-%s-%s-4", local.env_three_letter, local.location_short, var.codename, var.sap_sid)),"--","-"), 0, var.azlimits.kv)
  sdu_user_keyvault_name    = substr(replace(lower(format("kv-prm-%s-%s-%s-%s-3", local.env_three_letter, local.location_short, var.codename, var.sap_sid)),"--","-"), 0, var.azlimits.kv)

  deployer_private_keyvault_name = substr(replace(lower(format("kv-prm-%s-%s-%s-4", local.env_three_letter, local.location_short, var.codename)),"--","-"), 0, var.azlimits.kv)
  deployer_user_keyvault_name    = substr(replace(lower(format("kv-prm-%s-%s-%s-3", local.env_three_letter, local.location_short, var.codename)),"--","-"), 0, var.azlimits.kv)

  landscape_private_keyvault_name = substr(replace(lower(format("kv-prm-%s-%s-%s-4", local.env_three_letter, local.location_short, var.codename)),"--","-"), 0, var.azlimits.kv)
  landscape_user_keyvault_name    = substr(replace(lower(format("kv-prm-%s-%s-%s-3", local.env_three_letter, local.location_short, var.codename)),"--","-"), 0, var.azlimits.kv)

  library_private_keyvault_name = substr(replace(lower(format("kv-prm-%s-%s-%s-4", local.env_three_letter, local.location_short, var.codename)),"--","-"), 0, var.azlimits.kv)
  library_user_keyvault_name    = substr(replace(lower(format("kv-prm-%s-%s-%s-3", local.env_three_letter, local.location_short, var.codename)),"--","-"), 0, var.azlimits.kv)

}
