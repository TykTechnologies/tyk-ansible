# Tested ##################################################
# RHEL 7
###########################################################

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
sudo rm /etc/yum.repos.d/tyk_tyk-gateway.repo 2> /dev/null

echo '[tyk_tyk-gateway]
name=tyk_tyk-gateway
baseurl=https://packagecloud.io/tyk/tyk-gateway/el/7/$basearch
repo_gpgcheck=1
gpgcheck=1
enabled=1
gpgkey=https://keyserver.tyk.io/tyk.io.rpm.signing.key.2020
       https://packagecloud.io/tyk/tyk-gateway/gpgkey
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
metadata_expire=300' > tyk_tyk-gateway.repo

sudo mv tyk_tyk-gateway.repo  /etc/yum.repos.d/tyk_tyk-gateway.repo

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
