
sudo bash -s <<-SUDO
apt-get -y update
apt-get -y install curl wget
SUDO
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable # -v 2.0.28

