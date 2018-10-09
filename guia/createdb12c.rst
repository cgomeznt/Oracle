Crear una Base de Datos en Oracle 12c
========================================


Desde el punto de vista físico, una base de datos es para oracle, un conjunto de ficheros, a saber:

	datafiles, ficheros de datos, definidos en la creación de la base de datos.
	log files, ficheros de log, definidos tambien en la creación de la base de datos.
	init.ora, fichero de texto que contiene los parámetros de configuración de la base de datos.
	control files, ficheros de control, definidos en el init.ora
	password file, fichero con la password del BDA y los operadores (todos los demas usuarios estan definidos en tablas).

Asi para crear una base de datos, una vez instalado oracle, debemos seguir los siguientes pasos:

Definir ORACLE_SID
+++++++++++++++++++

	$ ORACLE_SID=GESTION
	$ echo $ORACLE_SID
	GESTION

Crear el fichero INIT.ORA
++++++++++++++++++++++++++

	$ vi $ORACLE_HOME/dbs/initGESTION.ora

	control_files = (/path/to/control1.ctl,/path/to/control2.ctl,/path/to/control3.ctl)
	undo_management = AUTO
	undo_tablespace = UNDOTBS1
	db_name = GESTION
	db_block_size = 8192
	sga_max_size = 1073741824
	sga_target = 1073741824 

Definir fichero de passwords
++++++++++++++++++++++++++++

	$ orapwd file=$ORACLE_HOME/dbs/pwdGESTION.ora password=America.21 entries=10

Podemos generar los pasos 2) y 3) con una sola instrucción:
Copiar

	oradim -new -sid GESTION -intpwd  -maxusers 20 -startmode auto
	 -pfile E:\Oracle\Product\10.0.0\Database\initGESTION.ora

Arrancar la instancia
+++++++++++++++++++++

sqlplus  / as sysdba
sql> startup nomount


Crea la base de datos con el nombre(o SID) GESTION y el char set WE8ISO8859P1

CREATE DATABASE GESTION
LOGFILE 'u01/app/oracle/oradata/GESTION/LOG1GESTION.ORA' SIZE 2M,
'/u01/app/oracle/oradata/GESTION/LOG2GESTION.ORA' SIZE 2M,
'/u01/app/oracle/oradata/GESTION/LOG3GESTION.ORA' SIZE 2M,
'/u01/app/oracle/oradata/GESTION/LOG4GESTION.ORA' SIZE 2M,
'/u01/app/oracle/oradata/GESTION/LOG5GESTION.ORA' SIZE 2M
EXTENT MANAGEMENT LOCAL
MAXDATAFILES 100
DATAFILE 'u01/app/oracle/oradata/GESTION/SYS1GESTION.ORA' SIZE 50 M
DEFAULT TEMPORARY TABLESPACE temp TEMPFILE 'u01/app/oracle/oradata/GESTION/GESTION/TEMP.ORA' SIZE 50 M
UNDO TABLESPACE undo DATAFILE 'u01/app/oracle/oradata/GESTION/UNDO.ORA' SIZE 50 M
NOARCHIVELOG
CHARACTER SET AL32UTF8;

