echo "******************************************************************************"
echo "Amend hosts file with public, private and virtual IPs." `date`
echo "******************************************************************************"
cat >> /etc/hosts <<EOF
# Public
${NODE_PUBLIC_IP}  ${NODE_FQ_HOSTNAME}  ${NODE_HOSTNAME}
EOF
