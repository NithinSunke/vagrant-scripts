param (
    [string]$vmName
)

# Unregister and delete the VirtualBox VM
VBoxManage unregistervm $vmName --delete

Write-Host "Virtual machine '$vmName' has been deleted."
