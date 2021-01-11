**Initialization**


terraform init --backend-config backend-config.tfvars -var-file PROTO-NOEU-LANDSCAPE.json ../../../sap-hana/deploy/terraform/run/sap_landscape

**Plan**

terraform plan -var-file PROTO-NOEU-LANDSCAPE.json ../../../sap-hana/deploy/terraform/run/sap_landscape/

**Apply**

terraform apply -var-file PROTO-NOEU-LANDSCAPE.json ../../../sap-hana/deploy/terraform/run/sap_landscape/