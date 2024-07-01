param (
    [string]$vmName,
    [string]$vmdiskname
)

VBoxManage createhd --filename D:\VMBOXES\$vmName\$vmdiskname --size 25600

VBoxManage storageattach "$vmName" --storagectl "SATA Controller" --port 3 --device 0 --type hdd --medium D:\VMBOXES\$vmName\$vmdiskname   

