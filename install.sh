#!/bin/bash
echo "this script will remove current nagios configuration and install\
mknagconf example configuration and install the perl script in\
/usr/local/bin"
echo "press enter to continue or abort with control-c"
read
echo "removing current nagios config"
rm /etc/nagios3/conf.d/*
echo "Installing static configuration"
cp -r conf.d/* /etc/nagios3/conf.d/
echo "Install example definitions, you have to edit these later"
cp -r definitions /etc/nagios3/
echo "installing the makefile"
cp Makefile /etc/nagios3/
echo "copying sensible defaults" 
cp commands.cfg cgi.cfg /etc/nagios3/
echo "installing mknagconf script in /usr/local/bin"
cp mknagconf /usr/local/bin/
echo "hoorayy... done :-)"

