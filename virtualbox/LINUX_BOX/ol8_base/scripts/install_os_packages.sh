echo "******************************************************************************"
echo "Prepare yum with the latest repos." `date`
echo "******************************************************************************"
echo "nameserver 192.168.0.10" >> /etc/resolv.conf

cd /etc/yum.repos.d
rm -f public-yum-ol7.repo
wget https://yum.oracle.com/public-yum-ol7.repo

#yum update -y
