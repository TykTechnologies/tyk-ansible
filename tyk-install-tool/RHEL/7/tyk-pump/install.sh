###########################################################
# Install Python 3.4 and packages to support signed
# packages
###########################################################
sudo yum install -y python34 pygpgme yum-utils wget

###########################################################
# Copy tyk-pump yum repo config
###########################################################
sudo rm -rf /etc/yum.repos.d/tyk_tyk-pump*
sudo cp tyk_tyk-pump.repo /etc/yum.repos.d/tyk_tyk-pump.repo

###########################################################
# Install tyk-pump
###########################################################
sudo yum install -y tyk-pump

###########################################################
# Setup tyk-pump
###########################################################
sudo /opt/tyk-pump/install/setup.sh \
  --redishost=localhost \
  --redisport=6379 \
  --mongo=mongodb://localhost:27017/tyk_analytics

###########################################################
# Enable and start tyk-pump service
###########################################################
sudo systemctl enable --now tyk-pump
