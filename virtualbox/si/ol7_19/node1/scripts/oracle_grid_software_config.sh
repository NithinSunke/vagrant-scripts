. /vagrant_config/install.env

echo "******************************************************************************"
echo "Do grid configuration." `date`
echo "******************************************************************************"
${GRID_HOME}/gridSetup.sh -silent -executeConfigTools \
        -responseFile ${GRID_HOME}/install/response/gridsetup.rsp \
        INVENTORY_LOCATION=${ORA_INVENTORY} \
        SELECTED_LANGUAGES=${ORA_LANGUAGES} \
        oracle.install.option=HA_CONFIG \
        ORACLE_BASE=${ORACLE_BASE} \
        oracle.install.asm.OSDBA=dba \
        oracle.install.asm.OSASM=dba \
        oracle.install.crs.config.autoConfigureClusterNodeVIP=false \
        oracle.install.asm.storageOption=ASM \
        oracle.install.asm.diskGroup.name=CRS \
        oracle.install.asm.diskGroup.redundancy=EXTERNAL \
        oracle.install.asm.diskGroup.disks=/dev/oracleasm/asm-crs-disk1,/dev/oracleasm/asm-crs-disk2,/dev/oracleasm/asm-crs-disk3 \
        oracle.install.asm.diskGroup.diskDiscoveryString=/dev/oracleasm/* \
        oracle.install.asm.monitorPassword=${SYS_PASSWORD} \
        oracle.install.asm.SYSASMPassword=${SYS_PASSWORD} \
        oracle.install.asm.configureAFD=false \
        oracle.install.asm.monitorPassword=${SYS_PASSWORD} \
        oracle.install.crs.rootconfig.executeRootScript=false

echo "******************************************************************************"
echo "Create additional diskgroups." `date`
echo "******************************************************************************"
. /home/oracle/scripts/grid_env

sqlplus / as sysasm <<EOF
CREATE DISKGROUP data EXTERNAL REDUNDANCY DISK '/dev/oracleasm/asm-data-disk1'
       ATTRIBUTE 'compatible.asm'='19.0','compatible.rdbms'='19.0';
CREATE DISKGROUP reco EXTERNAL REDUNDANCY DISK '/dev/oracleasm/asm-reco-disk1'
       ATTRIBUTE 'compatible.asm'='19.0','compatible.rdbms'='19.0';

SET LINESIZE 100
COLUMN name FORMAT A30
SELECT name, compatibility FROM v\$asm_diskgroup ORDER BY name;
EXIT;
EOF

echo "******************************************************************************"
echo "Check cluster configuration." `date`
echo "******************************************************************************"
${GRID_HOME}/bin/crsctl stat res -t
