# Get this machine up to date so that the rest of our stuff will work
sudo apt-get update

# Dependencies
sudo apt-get install unzip

#Download and execute a script that will setup Java 7 in a local apt-get repo for us
cd ~/
wget https://github.com/flexiondotorg/oab-java6/raw/0.2.8/oab-java.sh -O oab-java.sh
chmod +x oab-java.sh
sudo ./oab-java.sh -7

# Install Java 7
sudo apt-get install oracle-java7-jdk -y

# Lets start dealing with Weblogic
sudo mkdir -p /opt/weblogic
sudo chown -R vagrant /opt/weblogic 
cd /opt/weblogic
# TODO: Remove this from Dropbox and find some other way to grab it
wget https://dl.dropboxusercontent.com/u/27702652/dist/wls1212_dev.zip -O wl12.zip
# cp /vagrant/wls1212_dev.zip wl12.zip
unzip wl12.zip

# Set env vars in .bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-7-oracle/' >> /home/vagrant/.bashrc
echo 'export MW_HOME=/opt/weblogic/wls12120' >> /home/vagrant/.bashrc
echo 'export PATH=$PATH:/usr/lib/jvm/java-7-oracle/jre/bin' >> /home/vagrant/.bashrc
echo 'export JAVA_OPTIONS="-Djava.security.egd=file:/dev/./urandom"' >> /home/vagrant/.bashrc

# Load the new env vars
PS1='$ '
source /home/vagrant/.bashrc

# Install and configure weblogic
cd /opt/weblogic/wls12120
chmod +x configure.sh
/opt/weblogic/wls12120/configure.sh -silent

# This is a hack. Can't figure out why the Weblogic classloader won't pick up the tools.jar
sudo cp /usr/lib/jvm/java-7-oracle/lib/tools.jar /usr/lib/jvm/java-7-oracle/jre/lib/tools.jar 

/opt/weblogic/wls12120/wlserver/server/bin/setWLSEnv.sh


# Command used to generate the weblogic domain.  Not needed, just here for referenece
# java -Dweblogic.Domain=SimpleDomain -Dweblogic.Name=SimpleServer -Dweblogic.management.username=weblogic  -Dweblogic.management.password=welcome1 -Dweblogic.ListenPort=7001 -jar /opt/weblogic/wls12120/wlserver/server/lib/weblogic.jar weblogic.Server

# Copy over the weblogic domain/start scripts
cd /opt/weblogic
cp -R /vagrant/domain domain

# Not sure why this isn't sticking because we do it earlier in the process.  Debug later.
sudo chown -R vagrant /opt/weblogic

# Link up a way to start weblogic from our home dir
cd ~/
ln -s /opt/weblogic/domain/startWebLogic.sh startWebLogic.sh