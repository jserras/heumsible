apt-get update && apt-get dist-upgrade
apt-get install python sudo openssh-server
#adduser dirjax sudo
echo "dirjax ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/dirjax
sudo chmod 440 /etc/sudoers.d/dirjax
