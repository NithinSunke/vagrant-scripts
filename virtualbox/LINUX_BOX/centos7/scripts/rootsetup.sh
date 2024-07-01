. /vagrant_config/install.env
#echo "mounting the nfs share"
#mkdir -p /nfsshare
#mount -t nfs 192.168.1.10:/nfsshare /nfsshare
df -kh

echo "installing os packages"
sh /vagrant_scripts/install_os_packages.sh

sh /vagrant_scripts/prepare_u01_disk.sh

echo "******************************************************************************"
echo "Set root and oracle password and change ownership of /u01." `date`
echo "******************************************************************************"
echo -e "${ROOT_PASSWORD}\n${ROOT_PASSWORD}" | passwd


sh /vagrant_scripts/configure_hostname.sh
