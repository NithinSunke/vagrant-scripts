echo "******************************************************************************"
echo "Prepare yum with the latest repos." `date`
echo "******************************************************************************"
echo "nameserver 192.168.0.10" >> /etc/resolv.conf

# Base installation.
dnf install -y oracle-epel-release-el8
dnf install -y ansible

# Packages for demos.
dnf install -y git
