firewall_deployment=true
assign_subscription_permissions=false

firewall_allowed_ipaddresses= [
    "52.158.42.90",
    "13.79.120.39",
    "52.155.248.41",
    "13.91.47.76",
    "40.85.190.91",
    "52.187.75.218",
    "52.174.163.213",
    "52.237.203.198"
  ]

  firewall_rule_subnets: [
    "10.100.0.0/27",
    "10.100.0.32/27",
    "10.100.0.64/27",
    "10.200.0.0/27",
    "10.200.0.32/27",
    "10.200.0.64/27",
  ]

# PROD-WEEU-DEP00-INFRASTRUCTURE.terraform.tfstate
# PROD-WEEU-SAP00-INFRASTRUCTURE.terraform.tfstate
# /subscriptions/8d8422a3-a9c1-4fe9-b880-adcf61557c71/resourceGroups/PROD-WEEU-SAP_LIBRARY/providers/Microsoft.Storage/storageAccounts/prodweeutfstate246