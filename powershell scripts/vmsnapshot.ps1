param (
    [string]$vmName,
    [string]$snapshotName
)

# Stop the VirtualBox VM
VBoxManage controlvm $vmName poweroff

# Take a snapshot of the VM
VBoxManage snapshot $vmName take $snapshotName

# Start the VirtualBox VM
VBoxManage startvm $vmName --type headless
