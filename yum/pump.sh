# Tested ##################################################
# RHEL 7
###########################################################

###########################################################
# Install Python 3.4 and packages to support signed
# packages
###########################################################
sudo yum install -y python34 pygpgme yum-utils wget

###########################################################
# Copy tyk-pump yum repo config
###########################################################
sudo rm /etc/yum.repos.d/tyk_tyk-pump.repo 2> /dev/null

echo '[tyk_tyk-pump]
name=tyk_tyk-pump
baseurl=https://packagecloud.io/tyk/tyk-pump/el/7/$basearch
repo_gpgcheck=1
gpgcheck=1
enabled=1
gpgkey=https://keyserver.tyk.io/tyk.io.rpm.signing.key.2020
       https://packagecloud.io/tyk/tyk-pump/gpgkey
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
metadata_expire=300' > tyk_tyk-pump.repo

sudo mv tyk_tyk-pump.repo  /etc/yum.repos.d/tyk_tyk-pump.repo

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
