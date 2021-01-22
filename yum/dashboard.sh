# Tested ##################################################
# RHEL 7
###########################################################

###########################################################
# Install Python 3.4 and packages to support signed
# packages
###########################################################
sudo yum install -y python34 pygpgme yum-utils wget

###########################################################
# Copy tyk-dashboard yum repo config
###########################################################
sudo rm /etc/yum.repos.d/tyk_tyk-dashboard.repo 2> /dev/null

echo '[tyk_tyk-dashboard]
name=tyk_tyk-dashboard
baseurl=https://packagecloud.io/tyk/tyk-dashboard/el/7/$basearch
repo_gpgcheck=1
gpgcheck=1
enabled=1
gpgkey=https://keyserver.tyk.io/tyk.io.rpm.signing.key.2020
       https://packagecloud.io/tyk/tyk-dashboard/gpgkey
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
metadata_expire=300' > tyk_tyk-dashboard.repo

sudo mv tyk_tyk-dashboard.repo  /etc/yum.repos.d/tyk_tyk-dashboard.repo

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
  --mongo=mongodb://localhost:27017/tyk_analytics \
  --tyk_api_hostname=localhost:8080 \
  --tyk_node_hostname=http://localhost \
  --tyk_node_port=8080 \
  --portal_root=/portal \
  --domain=http://localhost

###########################################################
# Enable and start tyk-dashboard service
###########################################################
sudo systemctl enable --now tyk-dashboard
