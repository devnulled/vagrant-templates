# Vagrant Template For Oracle Weblogic 12c

This template will get you up and running with Oracle Weblogic 12c very quickly to deploy wars for testing, etc.  

I honestly do not know much of anything about Weblogic, so there's likely some things that could suck a lot less.  I didn't do anything fancy either as far as convenience scripts, etc.  This VM is pretty quick and dirty.

## VM Details

* Ubuntu 12.x LTS
* Java 7
* Weblogic 12c
* Assigns 3G of RAM and limits CPU to 50% on the VirtualBox platform

Java is installed easily thanks to the great [OAB-Java](https://github.com/flexiondotorg/oab-java6) project.

Weblogic took me a full work day to get working.  It can go die in a fire.


## General Weblogic Details

- All of the Weblogic shizz lives under the `/opt/weblogic` directory and is owned by vagrant.
- The WAR autodeploy directory is under `/opt/weblogic/domain/domain/autodeploy/`
- Server Root:  [http://localhost:7001/](http://localhost:7001/)

### Weblogic Environment Variables

You can alter the memory it uses and so forth temporarily by altering the `/opt/weblogic/domain/domain/bin/startWebLogic.sh` script

## How Do I?

### Start Weblogic

Weblogic can be easily started by running the `~/startWebLogic.sh` script.

### Deploy a WAR

The easist way I know of is to copy a WAR to the VM directory and then copy that to the autodeploy directory in Weblogic.  Lets say you have a WAR called `project.war`…

1. Copy your war to the `weblogic-12c` directory of the `vagrant-templates` git project.
2. Make sure you are in an active SSH session with the running Weblogic VM.  From there, run `cp /vagrant/project.war /opt/weblogic/domain/domain/autodeploy/` 

### View The Logs

The log files for the default running Weblogic instance can be found under `/opt/weblogic/domain/domain/servers/SimpleServer/logs`

### Access The Admin Console

Admin Console: [http://localhost:7001/console](http://localhost:7001/console) 

* username: `weblogic`  
* password: `welcome1`

### Stop Weblogic

- Currently the `~/startWebLogic.sh` script just runs in interactive mode.  Control-C out of it.

### Change The Weblogic Environment Variables

You can alter the memory Weblogic uses and so forth temporarily by altering the `/opt/weblogic/domain/domain/bin/startWebLogic.sh` script

### Shutdown The VM So I Don't Have To Bootstrap It Again

Once you have exited all running SSH sessions in the VM, just run `vagrant suspend` against the VM on your local machine.

### Report Problems With This VM

Submit a GitHub ticket please, or even better, a pull request.  :)