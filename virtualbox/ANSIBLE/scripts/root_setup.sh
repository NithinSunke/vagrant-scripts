sh /vagrant/scripts/install_os_packages.sh

echo "******************************************************************************"
echo "Edit hosts and ansible hosts." `date`
echo "******************************************************************************"
cat >> /etc/hosts <<EOF
192.168.0.20 ansible-server.scs.com ansible-server
EOF

cat >> /etc/ansible/hosts <<EOF
ansible-server.scs.com

[appservers]
appserver1.scs.com
appserver2.scs.com

[databases]
database1.scs.com
EOF

echo "******************************************************************************"
echo "Check ansible version." `date`
echo "******************************************************************************"
ansible --version
