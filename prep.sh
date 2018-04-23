apt-get update && apt-get dist-upgrade
apt-get install python sudo openssh-server
#adduser pmouthaan sudo
echo "pmouthaan ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/pmouthaan
sudo chmod 440 /etc/sudoers.d/pmouthaan
