locals {

  sdu_private_keyvault_name = replace(lower(format("kv-prem-%s-%s-%s-%s-02", local.env_mapping_fullname, var.location, var.codename, var.sap_sid, local.random_id_verified)),"--","-")
  sdu_user_keyvault_name    = replace(lower(format("kv-prem-%s-%s-%s-%s-01", local.env_mapping_fullname, var.location, var.codename, var.sap_sid, local.random_id_verified)),"--","-")

  deployer_private_keyvault_name = replace(lower(format("kv-prem-%s-%s-%s-02", local.env_mapping_fullname, var.location, var.codename, local.random_id_verified)),"--","-")
  deployer_user_keyvault_name    = replace(lower(format("kv-prem-%s-%s-%s-01", local.env_mapping_fullname, var.location, var.codename, local.random_id_verified)),"--","-")

  landscape_private_keyvault_name = replace(lower(format("kv-prem-%s-%s-%s-02", local.env_mapping_fullname, var.location, var.codename, local.random_id_verified)),"--","-")
  landscape_user_keyvault_name    = replace(lower(format("kv-prem-%s-%s-%s-01", local.env_mapping_fullname, var.location, var.codename, local.random_id_verified)),"--","-")

  library_private_keyvault_name = replace(lower(format("kv-prem-%s-%s-%s-02", local.env_mapping_fullname, var.location, var.codename, local.random_id_verified)),"--","-")
  library_user_keyvault_name    = replace(lower(format("kv-prem-%s-%s-%s-01", local.env_mapping_fullname, var.location, var.codename, local.random_id_verified)),"--","-")

}
