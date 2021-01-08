###########################################################
# Install Redis
###########################################################
sudo apt update
sudo apt install -y redis-server

###########################################################
# Update Redis config
###########################################################
sudo sed -i 's/^supervised no$/supervised systemd/g' /etc/redis/redis.conf

###########################################################
# Enable and start redis service
###########################################################
sudo systemctl restart redis.service
sudo systemctl enable /lib/systemd/system/redis-server.service