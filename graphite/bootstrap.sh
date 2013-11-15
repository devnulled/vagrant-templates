function printHeader
{
    echo -e "\n\033[1;33m>>>>>>>>>> \033[1;4;35m${1}\033[0m \033[1;33m<<<<<<<<<<\033[0m\n"
}


# Get this machine up to date so that the rest of our stuff will work
printHeader 'UPDATING APT-GET'
sudo apt-get update

# Dependencies
printHeader 'INSTALLING DEFAULT DEPENDENCIES'
sudo apt-get install unzip -y

# Set locale
printHeader 'SETTING LOCALE'
sudo locale-gen en_US.UTF-8

# Move to our mount point
cd /vagrant

# Make sure the graphite setup script is +x
sudo chmod +x ext/setup-graphite/ubuntu.bash

# Install Graphite
./ext/setup-graphite/ubuntu.bash -l 'graphite' -p 'graphite' -e 'root@localhost.com'

# Move back home
cd /home/vagrant

# Link to the start/stop/restart scripts
printHeader 'LINKING START STOP RESTART SCRIPTS'
ln -s /vagrant/ext/setup-graphite/bin/start /home/vagrant/graphite-start.sh
ln -s /vagrant/ext/setup-graphite/bin/stop /home/vagrant/graphite-stop.sh
ln -s /vagrant/ext/setup-graphite/bin/restart /home/vagrant/graphite-restart.sh

# Stop graphite, setup our local config so we can edit it from our local machine, start-up again
printHeader 'LINKING GRAPHITE CONFIG TO LOCAL FILES'
sudo ./graphite-stop.sh

sudo mv /opt/graphite/conf /opt/graphite/default-conf-backup
sudo ln -s /vagrant/graphite-tweakable-config/conf /opt/graphite/conf

sudo ./graphite-start.sh