. /nfsshare/vagrant-scripts/dataguard/ol7_112/config/install.env

sh /nfsshare/vagrant-scripts/dataguard/ol7_112/shared_scripts/prepare_u01_disk.sh

sh /nfsshare/vagrant-scripts/dataguard/ol7_112/shared_scripts/install_os_packages.sh

echo "******************************************************************************"
echo "Set root and oracle password and change ownership of /u01." `date`
echo "******************************************************************************"
echo -e "${ROOT_PASSWORD}\n${ROOT_PASSWORD}" | passwd
echo -e "${ORACLE_PASSWORD}\n${ORACLE_PASSWORD}" | passwd oracle
chown -R oracle:oinstall /u01
chmod -R 775 /u01

sh /nfsshare/vagrant-scripts/dataguard/ol7_112/shared_scripts/configure_hosts_base.sh

sh /nfsshare/vagrant-scripts/dataguard/ol7_112/shared_scripts/configure_chrony.sh

su - oracle -c 'sh /nfsshare/vagrant-scripts/dataguard/ol7_112/node1/scripts/oracle_user_environment_setup.sh'
. /home/oracle/scripts/setEnv.sh

sh /nfsshare/vagrant-scripts/dataguard/ol7_112/shared_scripts/configure_hostname.sh

su - oracle -c 'sh /nfsshare/vagrant-scripts/dataguard/ol7_112/shared_scripts/oracle_db_software_installation.sh'

echo "******************************************************************************"
echo "Run DB root scripts." `date` 
echo "******************************************************************************"
#sh ${ORA_INVENTORY}/orainstRoot.sh
sh ${ORACLE_HOME}/root.sh

su - oracle -c 'sh /nfsshare/vagrant-scripts/dataguard/ol7_112/node1/scripts/oracle_create_database.sh'
