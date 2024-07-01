param (
    [string]$vmName
)

# Get a list of snapshots for the VirtualBox VM
$snapshots = & "VBoxManage.exe" showvminfo $vmName --machinereadable | Where-Object {$_ -match "snapshot"}

# Extract snapshot names from the list
$snapshotNames = $snapshots -replace '.*?="([^"]*)"', '$1'

# Sort the snapshot names
$snapshotNames = $snapshotNames | Sort-Object -Descending

# Keep the most recent snapshot
$latestSnapshotName = $snapshotNames[0]

# Delete old snapshots
foreach ($snapshotName in $snapshotNames[1..($snapshotNames.Length - 1)]) {
    Write-Host "Deleting snapshot: $snapshotName"
    & "VBoxManage.exe" snapshot $vmName delete $snapshotName
}

Write-Host "Snapshot deletion completed."
