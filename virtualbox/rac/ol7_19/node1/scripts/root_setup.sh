. /vagrant_config/install.env

#sh /vagrant_scripts/prepare_u01_disk.sh

#sh /vagrant_scripts/install_os_packages.sh
#
#echo "******************************************************************************"
#echo "Set root and oracle password and change ownership of /u01." `date`
#echo "******************************************************************************"
#echo -e "${ROOT_PASSWORD}\n${ROOT_PASSWORD}" | passwd
#echo -e "${ORACLE_PASSWORD}\n${ORACLE_PASSWORD}" | passwd oracle
#chown -R oracle:oinstall /u01
#chmod -R 775 /u01
#usermod -aG vagrant oracle

#sh /vagrant_scripts/configure_hosts_base.sh

#cat > /etc/resolv.conf <<EOF
#search scslabs.com
#nameserver ${DNS_PUBLIC_IP}
#EOF

# Stop NetworkManager altering the /etc/resolve.conf contents.
#sed -i -e "s|\[main\]|\[main\]\ndns=none|g" /etc/NetworkManager/NetworkManager.conf
#systemctl restart NetworkManager.service

#sh /vagrant_scripts/configure_chrony.sh
#
#sh /vagrant_scripts/configure_shared_disks.sh

#su - oracle -c 'sh /vagrant/scripts/oracle_user_environment_setup.sh'
. /home/oracle/scripts/setEnv.sh
#
#sh /vagrant_scripts/configure_hostname.sh
#
#
#
#echo "******************************************************************************"
#echo "Install cvuqdisk package." `date`
#echo "******************************************************************************"
#yum install -y ${GRID_HOME}/cv/rpm/cvuqdisk-1.0.10-1.rpm
#ssh root@${NODE2_HOSTNAME} yum install -y /tmp/cvuqdisk-1.0.10-1.rpm
#
#su - oracle -c 'sh /vagrant/scripts/oracle_grid_software_installation.sh'
#
echo "******************************************************************************"
echo "Run grid root scripts." `date`
echo "******************************************************************************"
#sh ${ORA_INVENTORY}/orainstRoot.sh
#ssh root@${NODE2_HOSTNAME} sh ${ORA_INVENTORY}/orainstRoot.sh
#sh ${GRID_HOME}/root.sh
#ssh root@${NODE2_HOSTNAME} sh ${GRID_HOME}/root.sh
#
#su - oracle -c 'sh /vagrant/scripts/oracle_grid_software_config.sh'
#
#su - oracle -c 'sh /vagrant/scripts/oracle_db_software_installation.sh'
#
#echo "******************************************************************************"
#echo "Run DB root scripts." `date` 
##echo "******************************************************************************"
##sh ${ORACLE_HOME}/root.sh
#ssh root@${NODE2_HOSTNAME} sh ${ORACLE_HOME}/root.sh
#
su - oracle -c 'sh /vagrant/scripts/oracle_create_database.sh'
#