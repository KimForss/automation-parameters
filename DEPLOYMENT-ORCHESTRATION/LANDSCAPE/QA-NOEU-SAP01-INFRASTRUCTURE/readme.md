**Preparations**

**Deployment**

Code branch "kimforss-if-kv-provided-dont-read-deployertfstate-landscape"

```console
git checkout kimforss-if-kv-provided-dont-read-deployertfstate-landscape
```

```console
terraform init --backend-config backend-config.tfvars -upgrade=true ../../../sap-hana/deploy/terraform/run/sap_landscape/
```

```console
terraform plan -var-file QA-WEEU-SAP_LANDSCAPE.json ../../../sap-hana/deploy/terraform/run/sap_landscape/
```

```console
terraform apply -var-file QA-WEEU-SAP_LANDSCAPE.json ../../../sap-hana/deploy/terraform/run/sap_landscape/
```
