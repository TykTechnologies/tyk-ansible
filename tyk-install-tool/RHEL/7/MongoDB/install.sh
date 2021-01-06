###########################################################
# Copy MongoDB yum repo config
###########################################################
sudo rm -rf /etc/yum.repos.d/mongod*
sudo cp mongodb-org-4.4.repo /etc/yum.repos.d/mongodb-org-4.4.repo

###########################################################
# Install MongoDB
###########################################################
sudo yum install -y mongodb-org

###########################################################
# Enable and start mongod service
###########################################################
sudo systemctl enable --now mongod
