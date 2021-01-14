###########################################################
# Install EPEL
###########################################################
sudo yum install -y epel-release
# sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

###########################################################
# Install Redis and Tyk Dashboard
###########################################################
sudo yum install -y redis

###########################################################
# Enable and start redis service
###########################################################
sudo systemctl enable --now redis
