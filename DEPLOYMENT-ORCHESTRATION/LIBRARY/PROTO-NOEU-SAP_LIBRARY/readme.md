**Initialization**

terraform init --backend-config backend-config.tfvars -var-file PROTO-NOEU-SAP_LIBRARY.json ../../../sap-hana/deploy/terraform/run/sap_library/


**Plan**

terraform plan -var-file PROTO-NOEU-SAP_LIBRARY.json ../../../sap-hana/deploy/terraform/run/sap_library/

**Apply**

terraform apply -var-file PROTO-NOEU-SAP_LIBRARY.json ../../../sap-hana/deploy/terraform/run/sap_library/