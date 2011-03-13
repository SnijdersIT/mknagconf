#
# Makefile for the Nagios configuration files
#
# author: Alexander Schreiber <als@thangorodrim.de>
#
# version: $Id: Makefile,v 1.3 2003/05/04 20:38:14 als Exp $
# 

# adopt this if you have the executable for mkncf somewhere else
# (like /usr/local/bin)
MKNCF=./mkncf

all: hosts.cfg services.cfg hostextinfo.cfg

hosts.cfg:	hosts.def hosts.base 
	${MKNCF} hosts

services.cfg: hosts.def services.base services.def services_checks.def services_contacts.def
	${MKNCF} services
hostextinfo.cfg: hostextinfo.def
	${MKNCF} hostextinfo

clean: 
	rm -f hosts.cfg services.cfg hostextinfo.cfg

check:
	nagios -v nagios.cfg
