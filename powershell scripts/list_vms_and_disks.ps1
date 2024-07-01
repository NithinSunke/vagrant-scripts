# Get the list of all VirtualBox VMs
$vms = & "VBoxManage" list vms

# Output the list of VMs and their attached disks with sizes
foreach ($vm in $vms) {
    $vmName = $vm -replace '^"([^"]+)" .+', '$1'
    Write-Host "Virtual Machine: $vmName"
    
    # Get VM information including attached disks
    $vmInfo = & "VBoxManage" showvminfo $vmName
    
    # Extract disk information from VM information
    $disks = $vmInfo -split "`n" | Where-Object { $_ -match '^\s*IDE|SATA|SCSI' }
    foreach ($disk in $disks) {
        $diskInfo = $disk -split ', '
        $diskName = $diskInfo[0].Trim()
        $diskSize = $diskInfo[1].Trim()
        Write-Host "    Disk: $diskName, Size: $diskSize"
    }
}
