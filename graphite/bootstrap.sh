# Get this machine up to date so that the rest of our stuff will work
sudo apt-get update

# Dependencies
sudo apt-get install unzip -y

# Move to our mount point
cd /vagrant

# Make sure the graphite setup script is +x
sudo chmod +x ext/setup-graphite/ubuntu.bash

# Install Graphite
./ext/setup-graphite/ubuntu.bash -l 'graphite' -p 'graphite' -e 'root@localhost.com'