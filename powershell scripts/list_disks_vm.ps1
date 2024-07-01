param (
    [string]$vmName
)

VBoxManage.exe list hdds | Select-String -Pattern 'Location:'|Select-String -Pattern $vmName