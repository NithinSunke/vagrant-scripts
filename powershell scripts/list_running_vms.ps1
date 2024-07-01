# Get the list of running VirtualBox VMs
$runningVMs = & "VBoxManage" list runningvms

# Output the list of running VMs
foreach ($vm in $runningVMs) {
    Write-Host $vm
}
