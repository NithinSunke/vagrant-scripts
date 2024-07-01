param (
    [string]$vmName
)

# Start the VirtualBox VM
VBoxManage startvm $vmName --type headless

Write-Host "Virtual machine '$vmName' has been started."
