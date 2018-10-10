Instalar Oracle Express 11g en CentOS 6.5
=========================================

Primero que todo estos son los link que me ayudaron a crear esta documentacion:

https://docs.oracle.com/cd/E17781_01/install.112/e18802/toc.htm#XEINL126

https://community.oracle.com/thread/720284

http://blog-juanzgz82.rhcloud.com/primeros-pasos-con-oracle-xe-y-sql-developer/



Instalar los paquetes requeridos.::

	# yum --disablerepo=\* --enablerepo=c6-media install libgcc-4.4.7-4.el6.x86_64 libgcc-4.4.7-4.el6.i686 glibc-2.12-1.132.el6.i686 glibc-2.12-1.132.el6.x86_64

Instalar.::

	# ls -l
	total 308492
	-rw-r--r--. 1 root root 315891481 oct  8 16:07 oracle-xe-11.2.0-1.0.x86_64.rpm.zip

.::

	# unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip

.::

	# ls 
	Disk1  oracle-xe-11.2.0-1.0.x86_64.rpm.zip

	# cd Disk1/

	# ls 
	oracle-xe-11.2.0-1.0.x86_64.rpm  response  upgrade

.::

	# rpm -ivh oracle-xe-11.2.0-1.0.x86_64.rpm 
	Preparando...               ########################################### [100%]
	   1:oracle-xe              ########################################### [100%]
	Executing post-install steps...

	You must run '/etc/init.d/oracle-xe configure' as the root user to configure the database.

.::

	# /etc/init.d/oracle-xe configure

	Oracle Database 11g Express Edition Configuration
	-------------------------------------------------
	This will configure on-boot properties of Oracle Database 11g Express 
	Edition.  The following questions will determine whether the database should 
	be starting upon system boot, the ports it will use, and the passwords that 
	will be used for database accounts.  Press <Enter> to accept the defaults. 
	Ctrl-C will abort.

	Specify the HTTP port that will be used for Oracle Application Express [8080]:

	Specify a port that will be used for the database listener [1521]:

	Specify a password to be used for database accounts.  Note that the same
	password will be used for SYS and SYSTEM.  Oracle recommends the use of 
	different passwords for each database account.  This can be done after 
	initial configuration:Venezuela21
	Confirm the password:Venezuela21

	Do you want Oracle Database 11g Express Edition to be started on boot (y/n) [y]:

	Starting Oracle Net Listener...Done
	Configuring database...Done
	Starting Oracle Database 11g Express Edition instance...Done
	Installation completed successfully.

Realizamos algunas pruebas

	# ps -ef | grep pmon
	oracle    2799     1  0 16:13 ?        00:00:00 xe_pmon_XE

	# netstat -nat | grep -i listen
	tcp        0      0 :::8080                     :::*                        LISTEN      
	tcp        0      0 :::1521                     :::*                        LISTEN      
	tcp        0      0 :::22                       :::*                        LISTEN  

Configuramos los iptables.::

	# vi /etc/sysconfig/iptables
		-A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
		-A INPUT -m state --state NEW -m tcp -p tcp --dport 1521 -j ACCEPT
	
	# service iptables restart

.::

Probamos los link de Oracle Express

http://192.168.56.11:8080/apex/apex_admin

.. figure:: ../images/11/01.png

http://192.168.56.11:8080/apex/

.. figure:: ../images/11/02.png

Crear un WorkApace y su tabla
++++++++++++++++++++++++++++++

Ingresamos a http://192.168.56.11:8080/apex/apex_admin con el usuario admin y la clave que colocamos cuando estabamos instaland.

.. figure:: ../images/11/01.png

.. figure:: ../images/11/03.png

.. figure:: ../images/11/04.png

.. figure:: ../images/11/05.png

.. figure:: ../images/11/06.png

.. figure:: ../images/11/07.png

.. figure:: ../images/11/08.png

.. figure:: ../images/11/09.png

.. figure:: ../images/11/10.png


Ahora vamos a crear una tabla dentro de ese workspace, en http://192.168.56.11:8080/apex/

.. figure:: ../images/11/11.png

.. figure:: ../images/11/12.png

.. figure:: ../images/11/13.png

.. figure:: ../images/11/14.png

.. figure:: ../images/11/15.png

.. figure:: ../images/11/16.png


Ahora si olvidamos el password.::

	-bash-4.1$ sqlplus / as sysdba

	SQL*Plus: Release 11.2.0.2.0 Production on Fri Oct 7 10:31:47 2016

	Copyright (c) 1982, 2011, Oracle.  All rights reserved.


	Connected to:
	Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

	SQL> alter user system identified by Venezuela21;

	User altered.

	SQL> quit

Nos conectamos a la consola de sqlplus, pero nos validamos primero con el usaurio oracle y nos aseguramos que tenga setada todas las variables.::

	# su - oracle
	$ echo $ORACLE_HOME

	$ 
	$ . /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh

	$ORACLE_HOME
	/u01/app/oracle/product/11.2.0/xe

Lo dejamos fijo en el .bash_profile del usuario oracle.::

	$ cd
	$ pwd
	/u01/app/oracle
	$ vi .bash_profile
	. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh

.::

	$ sqlplus system

	SQL*Plus: Release 11.2.0.2.0 Production on Sat Oct 8 16:58:47 2016

	Copyright (c) 1982, 2011, Oracle.  All rights reserved.

	Enter password: 

	Connected to:
	Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

	SQL> 

.::


To view database.::
 
	SQL> select * from v$database;
 
To view instance.::
 
	SQL> select * from v$instance;
 
To view all users.::
 
	SQL> select * from all_users;

Ahora para bajar la base de datos y subirla .::

	SQL> conn sys as sysdba
	Enter password:
	Connected.
	SQL> shutdown normal
	Database closed.
	Database dismounted.
	ORACLE instance shut down.
	SQL>


	SQL> conn sys as sysdba
	Enter password:
	Connected.
	SQL> startup


