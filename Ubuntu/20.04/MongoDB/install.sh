###########################################################
# Copy MongoDB apt repo list
###########################################################
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
sudo rm -rf /etc/apt/sources.list.d/mongodb*
sudo cp mongodb-org-4.4.list /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt update

###########################################################
# Install MongoDB
###########################################################
sudo apt install -y mongodb-org

###########################################################
# Enable and start mongod service
###########################################################
sudo systemctl enable --now mongod
