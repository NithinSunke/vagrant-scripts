.  /tmp/CENTOS7_OS_POST_BUILD/install_env.sh

echo "******************************************************************************"
echo "Set Hostname." `date`
echo "******************************************************************************"
sudo hostnamectl set-hostname ${HOSTNAME}.${DOMAIN_NAME}
sudo hostname  ${HOSTNAME}.${DOMAIN_NAME}
sudo cat > /etc/hostname <<EOF
${HOSTNAME}.${DOMAIN_NAME}
EOF
