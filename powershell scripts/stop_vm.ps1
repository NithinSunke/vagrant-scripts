param (
    [string]$vmName
)

# Stop the VirtualBox VM
VBoxManage controlvm $vmName poweroff

Write-Host "Virtual machine '$vmName' has been stopped."
