###########################################################
# Add GPG key and install transport-https
###########################################################
curl -L https://packagecloud.io/tyk/tyk-gateway/gpgkey | sudo apt-key add -
sudo apt update
sudo apt install -y apt-transport-https

###########################################################
# Copy tyk-gateway apt repo list
###########################################################
sudo rm -rf /etc/apt/sources.list.d/tyk_tyk-gateway*
sudo cp tyk_tyk-gateway.list /etc/apt/sources.list.d/tyk_tyk-gateway.list
sudo apt update

###########################################################
# Install tyk-gateway
###########################################################
sudo apt install -y tyk-gateway

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
