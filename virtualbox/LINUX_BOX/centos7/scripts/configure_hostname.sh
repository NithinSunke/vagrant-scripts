
echo "******************************************************************************"
echo "Set Hostname." `date`
echo "******************************************************************************"
hostnamectl set-hostname ${HOSTNAME}
hostname ${HOSTNAME}
cat > /etc/hostname <<EOF
${HOSTNAME}
EOF
