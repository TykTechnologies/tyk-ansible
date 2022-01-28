sudo dnf install gcc openssl-devel bzip2-devel libffi-devel -y
cd /opt
sudo wget https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz
sudo tar xzf Python-3.7.9.tgz
sudo rm Python-3.7.9.tgz
sudo yum install make -y
cd Python-3.7.9
sudo ./configure --enable-optimizations
sudo make altinstall
sudo rm -rf /opt/Python-3.7.9
