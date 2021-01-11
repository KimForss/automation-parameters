**Preparations**

Resource group

```console
az group create --name QA-WEUE-SHARED --location westeurope
```

Keyvault 

```console
az keyvault create --location westeurope --name qaweeushared2021 --resource-group QA-WEUE-SHARED
```

Secrets

```console
az keyvault secret set --name "QA-subscription-id" --vault-name "qaweeushared2021" --value "<subscription-id>";
az keyvault secret set --name "QA-client-id"       --vault-name "qaweeushared2021" --value "<appId>";
az keyvault secret set --name "QA-client-secret"   --vault-name "qaweeushared2021" --value "<password>";
az keyvault secret set --name "QA-tenant-id"       --vault-name "qaweeushared2021" --value "<tenant>";
```


**Deployment**

Code branch "kimforss-if-kv-provided-dont-read-deployertfstate-library"

```console
git checkout kimforss-if-kv-provided-dont-read-deployertfstate-library
```

SAP Library

```console
terraform init ../../../sap-hana/deploy/terraform/bootstrap/sap_library/
```

```console
terraform plan -var-file QA-WEEU-SAP_LIBRARY.json ../../../sap-hana/deploy/terraform/bootstrap/sap_library/
```

```console
terraform apply -var-file QA-WEEU-SAP_LIBRARY.json ../../../sap-hana/deploy/terraform/bootstrap/sap_library/
```