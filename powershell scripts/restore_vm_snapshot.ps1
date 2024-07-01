param (
    [string]$vmName,
    [string]$newSnapshotName,
    [string]$oldSnapshotName
)

# Stop the VirtualBox VM
VBoxManage controlvm $vmName poweroff

# Take a new snapshot of the VM
VBoxManage snapshot $vmName take $newSnapshotName

# Restore the VM to the old snapshot
VBoxManage snapshot $vmName restore $oldSnapshotName

# Start the VirtualBox VM
VBoxManage startvm $vmName --type headless
