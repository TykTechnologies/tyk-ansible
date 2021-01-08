###########################################################
# Add GPG key and install transport-https
###########################################################
curl -L https://packagecloud.io/tyk/tyk-dashboard/gpgkey | sudo apt-key add -
sudo apt update
sudo apt install -y apt-transport-https

###########################################################
# Copy tyk-dashboard apt repo list
###########################################################
sudo rm -rf /etc/apt/sources.list.d/tyk_tyk-dashboard*
sudo cp tyk_tyk-dashboard.list /etc/apt/sources.list.d/tyk_tyk-dashboard.list
sudo apt update

###########################################################
# Install tyk-dashboard
###########################################################
sudo apt install -y tyk-dashboard

###########################################################
# Setup tyk-dashboard
###########################################################
sudo /opt/tyk-dashboard/install/setup.sh \
  --listenport=3000 \
  --redishost=localhost \
  --redisport=6379 \
  --mongo=mongodb://localhost/tyk_analytics \
  --tyk_api_hostname=ec2-44-242-137-103.us-west-2.compute.amazonaws.com:8080 \
  --tyk_node_hostname=http://localhost \
  --tyk_node_port=8080 \
  --portal_root=/portal \
  --domain=ec2-44-242-137-103.us-west-2.compute.amazonaws.com

###########################################################
# Enable and start tyk-dashboard service
###########################################################
sudo systemctl enable --now tyk-dashboard
