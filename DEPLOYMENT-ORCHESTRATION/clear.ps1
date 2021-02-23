Remove-Module SAPDeploymentUtilities -ErrorAction SilentlyContinue
Remove-Module install_library -ErrorAction SilentlyContinue
Remove-Module set_secrets -ErrorAction SilentlyContinue
Remove-Module install_environment -ErrorAction SilentlyContinue
Remove-Module installer -ErrorAction SilentlyContinue
Remove-Module install_deployer -ErrorAction SilentlyContinue
Remove-Module helper_functions -ErrorAction SilentlyContinue
#terraform  init -upgrade=true -force-copy -backend-config "subscription_id=8d8422a3-a9c1-4fe9-b880-adcf61557c71" -backend-config "resource_group_name=PROD-WEEU-SAP_LIBRARY" -backend-config "storage_account_name=prodweeutfstate246" -backend-config "container_name=tfstate" -backend-config "key=PROD-WEEU-DEP00-INFRASTRUCTURE.terraform.tfstate" C:\Work\Repos\sap-hana\\deploy\terraform\run\sap_deployer

function Remove-Items {
    param (
        $rgName,
        $dirname
    )

    Write-Host "Cleaning up " $rgName " and " $dirname
    $rg = Get-AzResourceGroup -n $rgname -ErrorAction SilentlyContinue
    if ($null -ne $rg) {
        Remove-AzResourceGroup -Name $rgname -Force                   
        Write-Host $rgName " removed"
    }

    if (Test-Path $dirname".terraform" -PathType Container) {
        remove-item $dirname".terraform" -Recurse

        Write-Host  $dirname".terraform" " removed"
    }
    else {
        Write-Host  $dirname".terraform" " not found"
    }
    if (Test-Path $dirname"terraform.tfstate" -PathType Leaf) {
        remove-item $dirname"terraform.tfstate" -Recurse
    }
    if (Test-Path $dirname"backup.tf" -PathType Leaf) {
        remove-item $dirname"backup.tf" -Recurse
    }
    if (Test-Path $dirname"terraform.tfstate.backup" -PathType Leaf) {
        remove-item $dirname"terraform.tfstate.backup" -Recurse
    }
    
    Write-Host "Leaving Remove-Items"
    return
            
}

$rgname = "PROD-WEEU-DEP00-INFRASTRUCTURE"
$dirname = "DEPLOYER\PROD-WEEU-DEP00-INFRASTRUCTURE\"

Remove-Items -rgName $rgname -dirname $dirname

$rgname = "PROD-WEEU-SAP00-INFRASTRUCTURE"
$dirname = "LANDSCAPE\PROD-WEEU-SAP00-INFRASTRUCTURE\"

Remove-Items -rgName $rgname -dirname $dirname

$rgname = "PROD-WEEU-SAP_LIBRARY"
$dirname = "LIBRARY\PROD-WEEU-SAP_LIBRARY\"

Remove-Items -rgName $rgname -dirname $dirname


Get-Module
