###########################################################
# Install Python 3.4 and packages to support signed
# packages
###########################################################
sudo yum install -y python34 pygpgme yum-utils wget

###########################################################
# Copy tyk-dashboard yum repo config
###########################################################
sudo rm -rf /etc/yum.repos.d/tyk_tyk-dashboard*
sudo cp tyk_tyk-dashboard.repo /etc/yum.repos.d/tyk_tyk-dashboard.repo

###########################################################
# Install tyk-dashboard
###########################################################
sudo yum install -y tyk-dashboard

###########################################################
# Setup tyk-dashboard
###########################################################
sudo /opt/tyk-dashboard/install/setup.sh \
  --listenport=3000 \
  --redishost=localhost \
  --redisport=6379 \
  --domain=ec2-44-234-121-209.us-west-2.compute.amazonaws.com \
  --mongo=mongodb://localhost:27017/tyk_analytics \
  --tyk_api_hostname=ec2-44-234-121-209.us-west-2.compute.amazonaws.com:8080 \
  --tyk_node_port=8080 \
  --portal_root=/portal

###########################################################
# Enable and start tyk-dashboard service
###########################################################
sudo systemctl enable --now tyk-dashboard
