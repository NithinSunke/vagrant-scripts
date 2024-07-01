. /vagrant_config/install.env

echo "******************************************************************************"
echo "Do grid configuration." `date`
echo "******************************************************************************"
${GRID_HOME}/gridSetup.sh -silent  \
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

