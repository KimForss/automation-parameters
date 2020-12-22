locals {

 /* sdu_name = length(var.codename) > 0 ? (
    upper(format("RG-%s-%s-%s-%s", local.env_verified, local.location_short, var.codename, var.sap_sid))) : (
    upper(format("RG-%s-%s-%s", local.env_verified, local.location_short, var.sap_sid))
  )

*/
  sdu_name = ""

  deployer_name  = "" //upper(format("RG-%s-%s", local.deployer_env_verified, local.deployer_location_short))
  landscape_name = upper(format("%s-%s", local.landscape_env_verified, local.location_short))
  library_name   = upper(format("%s-%s", local.library_env_verified, local.location_short))

  // Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only. The name must be unique.

  deployer_storageaccount_name       = substr(replace(lower(format("stg%s%s%sdepdiag%s", var.codename, var.environment, var.location, local.random_id_verified)), "/[^a-z0-9]/", ""), 0, var.azlimits.stgaccnt)
  landscape_storageaccount_name      = substr(replace(lower(format("stg%s%s%sdiag%s", var.codename, var.environment, var.location, local.random_id_verified)), "/[^a-z0-9]/", ""), 0, var.azlimits.stgaccnt)
  library_storageaccount_name        = substr(replace(lower(format("stg%s%s%ssaplib%s", var.codename, var.environment, var.location, local.random_id_verified)), "/[^a-z0-9]/", ""), 0, var.azlimits.stgaccnt)
  sdu_storageaccount_name            = substr(replace(lower(format("stg%s%s%sdiag%s", var.codename, var.environment, var.location, local.random_id_verified)), "/[^a-z0-9]/", ""), 0, var.azlimits.stgaccnt)
  terraformstate_storageaccount_name = substr(replace(lower(format("stg%s%s%stfstate%s", var.codename, var.environment, var.location, local.random_id_verified)), "/[^a-z0-9]/", ""), 0, var.azlimits.stgaccnt)

}
