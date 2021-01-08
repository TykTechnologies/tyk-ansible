###########################################################
# Add GPG key and install transport-https
###########################################################
curl -L https://packagecloud.io/tyk/tyk-pump/gpgkey | sudo apt-key add -
sudo apt update
sudo apt install -y apt-transport-https

###########################################################
# Copy tyk-pump apt repo list
###########################################################
sudo rm -rf /etc/apt/sources.list.d/tyk_tyk-pump*
sudo cp tyk_tyk-pump.list /etc/apt/sources.list.d/tyk_tyk-pump.list
sudo apt update

###########################################################
# Install tyk-pump
###########################################################
sudo apt install -y tyk-pump

###########################################################
# Setup tyk-pump
###########################################################
sudo /opt/tyk-pump/install/setup.sh \
  --redishost=localhost \
  --redisport=6379 \
  --mongo=mongodb://localhost/tyk_analytics

###########################################################
# Enable and start tyk-pump service
###########################################################
sudo systemctl enable --now tyk-pump
