. /nfsshare/vagrant-scripts/database/ol7_112/config/install.env

sh /nfsshare/vagrant-scripts/database/ol7_112/scripts/prepare_disks.sh

sh /nfsshare/vagrant-scripts/database/ol7_112/scripts/install_os_packages.sh
sh /nfsshare/vagrant-scripts/database/ol7_112/scripts/sethostname.sh
sh /nfsshare/vagrant-scripts/database/ol7_112/scripts/password_change.sh
mkdir -p ${SCRIPTS_DIR}
mkdir -p ${SOFTWARE_DIR}
mkdir -p ${DATA_DIR}
chown -R oracle.oinstall ${SCRIPTS_DIR} /u01 /u02

echo "******************************************************************************"
echo "Prepare environment and install the software." `date`
echo "******************************************************************************"
su - oracle -c 'sh /nfsshare/vagrant-scripts/database/ol7_112/scripts/oracle_user_environment_setup.sh'
su - oracle -c 'sh /nfsshare/vagrant-scripts/database/ol7_112/scripts/oracle_software_installation.sh'

echo "******************************************************************************"
echo "Run root scripts." `date`
echo "******************************************************************************"
sh ${ORA_INVENTORY}/orainstRoot.sh
sh ${ORACLE_HOME}/root.sh

echo "******************************************************************************"
echo "Create the database and install the ORDS software." `date`
echo "******************************************************************************"
su - oracle -c 'sh /nfsshare/vagrant-scripts/database/ol7_112/scripts/oracle_create_database.sh'
su - oracle -c 'sh /nfsshare/vagrant-scripts/database/ol7_112/scripts/ords_software_installation.sh'

sh /nfsshare/vagrant-scripts/database/ol7_112/scripts/oracle_service_setup.sh
