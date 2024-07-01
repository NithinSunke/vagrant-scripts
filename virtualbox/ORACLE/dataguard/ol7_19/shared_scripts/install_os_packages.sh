echo "******************************************************************************"
echo "Prepare yum repos and install base packages." `date`
echo "******************************************************************************"
echo "nameserver 192.168.1.10" >> /etc/resolv.conf

yum install -y yum-utils
yum install -y oracle-epel-release-el7
yum-config-manager --enable ol7_developer_EPEL
yum install -y zip unzip # sshpass 
yum install -y oracle-database-preinstall-19c
#yum -y update
