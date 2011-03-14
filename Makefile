#
# Makefile for the Nagios configuration files
#
# modified by: Job Snijders <job@snijders-it.nl>
# author: Alexander Schreiber <als@thangorodrim.de>
#

# adopt this if you have the executable for mkncf somewhere else
# (like /usr/local/bin)
MKNCF=./mkncf
DEF_PATH=./definitions/
CONFD_PATH=./conf.d/

all: ${CONFD_PATH}hosts_autogenerated.cfg ${CONFD_PATH}services_autogenerated.cfg ${CONFD_PATH}hostextinfo_autogenerated.cfg

${CONFD_PATH}hosts_autogenerated.cfg:	${DEF_PATH}hosts.def ${DEF_PATH}hosts.base 
	${MKNCF} ${DEF_PATH} ${CONFD_PATH} hosts

${CONFD_PATH}services_autogenerated.cfg: ${DEF_PATH}hosts.def ${DEF_PATH}services.base ${DEF_PATH}services.def ${DEF_PATH}services_checks.def ${DEF_PATH}services_contacts.def
	${MKNCF} ${DEF_PATH} ${CONFD_PATH} services

${CONFD_PATH}hostextinfo_autogenerated.cfg: ${DEF_PATH}hostextinfo.def
	${MKNCF} ${DEF_PATH} ${CONFD_PATH} hostextinfo

clean: 
	rm -f ${CONFD_PATH}hosts_autogenerated.cfg ${CONFD_PATH}services_autogenerated.cfg ${CONFD_PATH}hostextinfo_autogenerated.cfg

check:
	nagios3 -v nagios.cfg
