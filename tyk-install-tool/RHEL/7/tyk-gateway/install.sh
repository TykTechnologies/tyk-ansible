###########################################################
# Install EPEL
###########################################################
sudo yum install -y epel-release

###########################################################
# Install Python 3.4 and packages to support signed
# packages
###########################################################
sudo yum install -y python34 pygpgme yum-utils wget

###########################################################
# Copy tyk-gateway yum repo config
###########################################################
sudo rm -rf /etc/yum.repos.d/tyk_tyk-gateway*
sudo cp tyk_tyk-gateway.repo /etc/yum.repos.d/tyk_tyk-gateway.repo

###########################################################
# Install tyk-gateway
###########################################################
sudo yum install -y tyk-gateway

###########################################################
# Setup tyk-gateway
###########################################################
sudo /opt/tyk-gateway/install/setup.sh \
  --dashboard=1 \
  --listenport=8080 \
  --redishost=localhost \
  --redisport=6379

###########################################################
# Enable and start tyk-gateway service
###########################################################
sudo systemctl enable --now tyk-gateway
