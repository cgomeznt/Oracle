Instalar Cliente SQLPLUS en Debian
=================================


En primer lugar, debe descargar las descargas instantáneas del cliente. Instale un software extraterrestre para que pueda instalar paquetes rpm escribiendo el siguiente comando en la terminal.

https://www.oracle.com/technetwork/database/features/instant-client/index-097480.html

Instalar esta libreria que es necesario::
	
		apt-get install libaio1

Preparamos el directorio en donde estara la instalación::

		# mkdir -p /opt/oracle
		# chown simon:simon /opt/oracle
		
		$ cd /opt/oracle
		
Descomprimimos los archivos anteriormente descargados:: 

		$ unzip instantclient-basic-linux.x64-11.2.0.3.0.zip
		$ unzip instantclient-sqlplus-linux.x64-11.2.0.3.0.zip

Importante declarar y exportar la siguiente variable::

		$ export LD_LIBRARY_PATH=/opt/oracle/instantclient_11_2/

Realizamos la prueba de conexión::

		$ export ORACLE_SID=skint02
		$ ./sqlplus /nolog

		SQL*Plus: Release 11.2.0.3.0 Production on Wed Sep 5 09:45:36 2012

		Copyright (c) 1982, 2011, Oracle.  All rights reserved.

		SQL> connect sys/super_secret@prometheus.krenger.local/skint02 as sysdba
		Connected.
		SQL> select * from v$version;

		BANNER
		----------------------------------------------------------------
		Oracle Database 10g Enterprise Edition Release 10.2.0.5.0 - 64bi
		PL/SQL Release 10.2.0.5.0 - Production
		CORE    10.2.0.5.0      Production
		TNS for 64-bit Windows: Version 10.2.0.5.0 - Production
		NLSRTL Version 10.2.0.5.0 - Production

		SQL> exit
		Disconnected from Oracle Database 10g Enterprise Edition Release 10.2.0.5.0 - 64bit Production
		With the Partitioning, OLAP, Data Mining and Real Application Testing options
		$