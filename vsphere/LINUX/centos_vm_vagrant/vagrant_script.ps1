Set-Location -Path "D:\nfsshare\vagrant\gitlab\centos_vm_vagrant"
echo PWD: %CD%
vagrant up --provider=vmware_esxi
