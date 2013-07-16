# Vagrant Template For Oracle Weblogic 12c

This template will get you up and running with Oracle Weblogic 12c very quickly to deploy wars for testing, etc.  

I honestly do not know much of anything about Weblogic, so there's likely some things that could suck a lot less.

## VM Details
* Ubuntu 12.x LTS
* Java 7
* Weblogic 12c
* Assigns 3G of RAM and limits CPU to 50% on the VirtualBox platform

Java is installed easily thanks to the great [OAB-Java](https://github.com/flexiondotorg/oab-java6) project.

Weblogic took me a full work day to get working.  It can go die in a fire.


## Weblogic Details

All of the Weblogic shizz lives under the `/opt/weblogic` directory and is owned by vagrant.

Weblogic can be easily started by running the `~/startWebLogic.sh` script.

### Console Credentials and Details
* username: weblogic  
* password: welcome1

Server root:  [http://localhost:7001/](http://localhost:7001/)  
Admin Console: [http://localhost:7001/console](http://localhost:7001/console)

### Weblogic Environment Variables

You can alter the memory it uses and so forth temporarily by altering the `/opt/weblogic/domain/domain/bin/startWebLogic.sh` script