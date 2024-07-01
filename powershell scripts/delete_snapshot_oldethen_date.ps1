param (
    [string]$vmName,
    [string]$olderThanDate
)

# Get the snapshots of the VirtualBox VM
$snapshots = VBoxManage snapshot $vmName list --machinereadable

# Convert VBoxManage output to PowerShell objects
$snapshots = $snapshots -split "`n" | ForEach-Object {
    if ($_ -match '^SnapshotName="([^"]+)"') {
        [PSCustomObject]@{
            Name = $matches[1]
        }
    } elseif ($_ -match '^SnapshotUUID="([^"]+)"') {
        [PSCustomObject]@{
            UUID = $matches[1]
        }
    } elseif ($_ -match '^SnapshotCreationTime="([^"]+)"') {
        [PSCustomObject]@{
            CreationTime = [DateTime]::ParseExact($matches[1], 'yyyy-MM-ddTHH:mm:sszzz', $null)
        }
    }
}

# Filter snapshots older than the specified date
$oldSnapshots = $snapshots | Where-Object { $_.CreationTime -lt $olderThanDate }

# Delete the older snapshots
$oldSnapshots | ForEach-Object {
    VBoxManage snapshot $vmName delete $_.Name
}

Write-Host "Older snapshots older than $olderThanDate have been deleted."
