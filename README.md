# Brandon's Vagrant Templates
=================

Various Vagrant virutal machine templates I've needed to create virtual deployment environments, etc.  I'm certainly not a vagrant wizard-- these are mostly quick and dirty templates to get things up and running quickly.

## License
Please see this projects LICENSE.txt file

## Disclaimer
I have only ever tested these with Vagrant on Mac OS X and VirtualBox.  No idea if they work anywhere else.

Also, most of these are handrolled lame ass shell scripts.  Perhaps I will use Ansible for them instead someday.

## Getting Up and Running

Vagrant is VERY easy to configure and use.  Check out it's [install instructions](http://docs.vagrantup.com/v2/installation/)!

Once you have Vagrant installed, simply clone this project, `cd` to the project you want to run under this project, and type `vagrant up`, wait for the VM to spin up and get bootstrapped, then you can ssh into it using `vagrant ssh`.  It really is that simple.

