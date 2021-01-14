# Tested ##################################################
# RHEL 8
# RHEL 7
###########################################################

###########################################################
# Create MongoDB yum repo config
###########################################################
sudo rm /etc/yum.repos.d/mongodb-org-4.4.repo 2> /dev/null

echo '[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc' > mongodb-org-4.4.repo

sudo mv mongodb-org-4.4.repo /etc/yum.repos.d/mongodb-org-4.4.repo

###########################################################
# Install MongoDB
###########################################################
sudo yum install -y mongodb-org

###########################################################
# Enable and start mongod service
###########################################################
sudo systemctl enable --now mongod
