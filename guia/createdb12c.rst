Crear una Base de Datos en Oracle 12c
========================================


Desde el punto de vista físico, una base de datos es para oracle, un conjunto de ficheros, a saber:

	datafiles, ficheros de datos, definidos en la creación de la base de datos.
	log files, ficheros de log, definidos tambien en la creación de la base de datos.
	init.ora, fichero de texto que contiene los parámetros de configuración de la base de datos.
	control files, ficheros de control, definidos en el init.ora
	password file, fichero con la password del BDA y los operadores (todos los demas usuarios estan definidos en tablas).

Asi para crear una base de datos, una vez instalado oracle, debemos seguir los siguientes pasos tomados de la pagina oficial de Oracle.

https://docs.oracle.com/cd/B28359_01/server.111/b28310/create003.htm#ADMIN11073

Step 1: Specify an Instance Identifier (SID)
++++++++++++++++++++++++++++++++++++++

Decide on a unique Oracle system identifier (SID) for your instance, open a command window, and set the ORACLE_SID environment variable. Use this command windows for the subsequent steps.

ORACLE_SID is used to distinguish this instance from other Oracle Database instances that you may create later and run concurrently on the same host computer. The maximum number of characters for ORACLE_SID is 12, and only letters and numeric digits are permitted. On some platforms, the SID is case-sensitive.

	ORACLE_SID=mynewdb
	export ORACLE_SID

Step 2: Ensure That the Required Environment Variables Are Set
++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Depending on your platform, before you can start SQL*Plus (as required in Step 6: Connect to the Instance), you may have to set environment variables, or at least verify that they are set properly.

For example, on most platforms, ORACLE_SID and ORACLE_HOME must be set. In addition, it is advisable to set the PATH variable to include the ORACLE_HOME/bin directory. On the UNIX and Linux platforms, you must set these environment variables manually. On the Windows platform, OUI automatically assigns values to ORACLE_HOME and ORACLE_SID in the Windows registry. If you did not create a database upon installation, OUI does not set ORACLE_SID in the registry, and you will have to set the ORACLE_SID environment variable when you create your database later.:_

	export ORACLE_BASE=/u01/app/oracle
	export ORACLE_HOME=/u01/app/oracle/product/11.2.0
	export ORACLE_SID=mynewdb

Step 3: Choose a Database Administrator Authentication Method
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

You must be authenticated and granted appropriate system privileges in order to create a database. You can authenticate as an administrator with the required privileges in the following ways:

	With a password file

	With operating system authentication

In this step, you decide on an authentication method.

If you decide to authenticate with a password file, create the password file as described in "Creating and Maintaining a Password File". If you decide to authenticate with operating system authentication, ensure that you log in to the host computer with a user account that is a member of the appropriate operating system user group. On the UNIX and Linux platforms, for example, this is typically the dba user group. On the Windows platform, the user installing the Oracle software is automatically placed in the required user group

See Also:
"About Database Administrator Security and Privileges"
https://docs.oracle.com/cd/B28359_01/server.111/b28310/dba007.htm#ADMIN11059

"Database Administrator Authentication" for information about password files and operating system authentication
https://docs.oracle.com/cd/B28359_01/server.111/b28310/dba006.htm#i1006534

Step 4: Create the Initialization Parameter File
+++++++++++++++++++++++++++++++++++++++++++++++++

When an Oracle instance starts, it reads an initialization parameter file. This file can be a text file, which can be created and modified with a text editor, or a binary file, which is created and dynamically modified by the database. The binary file, which is preferred, is called a server parameter file. In this step, you create a text initialization parameter file. In a later step, you create a server parameter file from the text file.

One way to create the text initialization parameter file is to edit the sample presented in "Sample Initialization Parameter File - https://docs.oracle.com/cd/B28359_01/server.111/b28310/create005.htm#CIAGFFIE".

For convenience, store your initialization parameter file in the Oracle Database default location, using the default file name. Then when you start your database, it will not be necessary to specify the PFILE clause of the STARTUP command, because Oracle Database automatically looks in the default location for the initialization parameter file.

For more information about initialization parameters and the initialization parameter file, including the default name and location of the initialization parameter file for your platform, see "About Initialization Parameters and Initialization Parameter Files - https://docs.oracle.com/cd/B28359_01/server.111/b28310/create005.htm#i1013946".::

	$ cp $ORACLE_HOME/dbs/init.ora $ORACLE_HOME/dbs/initmynewdb.ora

	$ vi $ORACLE_HOME/dbs/initmynewdb.ora

	db_name='mynewdb'
	memory_target=800M
	processes = 150
	audit_file_dest='$ORACLE_BASE/admin/mynewdb/adump'
	audit_trail ='db'
	db_block_size=8192
	db_domain=''
	db_recovery_file_dest='$ORACLE_BASE/fast_recovery_area'
	db_recovery_file_dest_size=2G
	diagnostic_dest='$ORACLE_BASE'
	dispatchers='(PROTOCOL=TCP) (SERVICE=ORCLXDB)'
	open_cursors=300 
	remote_login_passwordfile='EXCLUSIVE'
	undo_tablespace='UNDOTBS1'
	# You may want to ensure that control files are created on separate physical
	# devices
	control_files = (ora_control1, ora_control2)
	compatible ='11.2.0'

	$ mkdir -p $ORACLE_BASE/admin/mynewdb/adump

	$ mkdir -p $ORACLE_BASE/fast_recovery_area

Step 6: Connect to the Instance
+++++++++++++++++++++++++++++++++


Start SQL*Plus and connect to your Oracle Database instance with the SYSDBA system privilege.

To authenticate with a password file, enter the following commands, and then enter the SYS password when prompted::

	$ sqlplus /nolog
	SQL> CONNECT SYS AS SYSDBA

To authenticate with operating system authentication, enter the following commands::

	$ sqlplus /nolog
	SQL> CONNECT / AS SYSDBA

SQL*Plus outputs the following message::

	Connected to an idle instance.

Step 4: Create a Server Parameter File
+++++++++++++++++++++++++++++++++++++++


The server parameter file enables you to change initialization parameters with the ALTER SYSTEM command and persist the changes across a database shutdown and startup. You create the server parameter file from your edited text initialization file.

The following SQL*Plus command reads the text initialization parameter file (PFILE) with the default name from the default location, creates a server parameter file (SPFILE) from the text initialization parameter file, and writes the SPFILE to the default location with the default SPFILE name.::

	SQL> CREATE SPFILE FROM PFILE;

	File created.

Step 8: Start the Instance
+++++++++++++++++++++++++++++

Start an instance without mounting a database. Typically, you do this only during database creation or while performing maintenance on the database. Use the STARTUP command with the NOMOUNT clause. In this example, because the initialization parameter file or server parameter file is stored in the default location, you are not required to specify the PFILE clause::

	SQL> STARTUP NOMOUNT
	ORACLE instance started.

	Total System Global Area  838860800 bytes
	Fixed Size		    8626240 bytes
	Variable Size		  553652160 bytes
	Database Buffers	  272629760 bytes
	Redo Buffers		    3952640 bytes



At this point, the instance memory is allocated and its processes are started. The database itself does not yet exist.

Step 9: Issue the CREATE DATABASE Statement
++++++++++++++++++++++++++++++++++++++++++++

To create the new database, use the CREATE DATABASE statement.

**Example 1**

The following statement creates database mynewdb. This database name must agree with the DB_NAME parameter in the initialization parameter file. This example assumes the following:

	The initialization parameter file specifies the number and location of control files with the CONTROL_FILES parameter.

	The directory /u01/app/oracle/oradata/mynewdb exists.
::


	CREATE DATABASE mynewdb USER SYS IDENTIFIED BY America21 USER SYSTEM IDENTIFIED BY America22 LOGFILE GROUP 1 ('/u01/app/oracle/oradata/mynewdb/redo01.log') SIZE 100M, GROUP 2 ('/u01/app/oracle/oradata/mynewdb/redo02.log') SIZE 100M, GROUP 3 ('/u01/app/oracle/oradata/mynewdb/redo03.log') SIZE 100M MAXLOGFILES 5 MAXLOGMEMBERS 5 MAXLOGHISTORY 1  MAXDATAFILES 100 CHARACTER SET US7ASCII NATIONAL CHARACTER SET AL16UTF16 EXTENT MANAGEMENT LOCAL DATAFILE '/u01/app/oracle/oradata/mynewdb/system01.dbf' SIZE 325M REUSE SYSAUX DATAFILE '/u01/app/oracle/oradata/mynewdb/sysaux01.dbf' SIZE 325M REUSE DEFAULT TABLESPACE users DATAFILE '/u01/app/oracle/oradata/mynewdb/users01.dbf' SIZE 500M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED DEFAULT TEMPORARY TABLESPACE tempts1 TEMPFILE '/u01/app/oracle/oradata/mynewdb/temp01.dbf' SIZE 20M REUSE UNDO TABLESPACE UNDOTBS1 DATAFILE '/u01/app/oracle/oradata/mynewdb/UNDOTBS1.dbf'  SIZE 200M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

Esto es lo mismo, pero esta formateado para hacerlo simple a la lectura.::

	CREATE DATABASE mynewdb
	   USER SYS IDENTIFIED BY America21
	   USER SYSTEM IDENTIFIED BY America22
	   LOGFILE GROUP 1 ('/u01/app/oracle/oradata/mynewdb/redo01.log') SIZE 100M,
		   GROUP 2 ('/u01/app/oracle/oradata/mynewdb/redo02.log') SIZE 100M,
		   GROUP 3 ('/u01/app/oracle/oradata/mynewdb/redo03.log') SIZE 100M
	   MAXLOGFILES 5
	   MAXLOGMEMBERS 5
	   MAXLOGHISTORY 1
	   MAXDATAFILES 100
	   CHARACTER SET US7ASCII
	   NATIONAL CHARACTER SET AL16UTF16
	   EXTENT MANAGEMENT LOCAL
	   DATAFILE '/u01/app/oracle/oradata/mynewdb/system01.dbf' SIZE 325M REUSE
	   SYSAUX DATAFILE '/u01/app/oracle/oradata/mynewdb/sysaux01.dbf' SIZE 325M REUSE
	   DEFAULT TABLESPACE users
	      DATAFILE '/u01/app/oracle/oradata/mynewdb/users01.dbf'
	      SIZE 500M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED
	   DEFAULT TEMPORARY TABLESPACE tempts1
	      TEMPFILE '/u01/app/oracle/oradata/mynewdb/temp01.dbf'
	      SIZE 20M REUSE
	   UNDO TABLESPACE UNDOTBS1
	      DATAFILE '/u01/app/oracle/oradata/mynewdb/UNDOTBS1.dbf'
	      SIZE 200M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;



A database is created with the following characteristics:

The database is named mynewdb. Its global database name is mynewdb.us.oracle.com, where the domain portion (us.oracle.com) is taken from the initialization file. See "Determining the Global Database Name".

Three control files are created as specified by the CONTROL_FILES initialization parameter, which was set before database creation in the initialization parameter file. See "Sample Initialization Parameter File" and "Specifying Control Files".

The passwords for user accounts SYS and SYSTEM are set to the values that you specified. Beginning with Release 11g, the passwords are case-sensitive. The two clauses that specify the passwords for SYS and SYSTEM are not mandatory in this release of Oracle Database. However, if you specify either clause, you must specify both clauses. For further information about the use of these clauses, see "Protecting Your Database: Specifying Passwords for Users SYS and SYSTEM".

The new database has three redo log files as specified in the LOGFILE clause. MAXLOGFILES, MAXLOGMEMBERS, and MAXLOGHISTORY define limits for the redo log. See Chapter 10, "Managing the Redo Log".

MAXDATAFILES specifies the maximum number of datafiles that can be open in the database. This number affects the initial sizing of the control file.

Note:

You can set several limits during database creation. Some of these limits are limited by and affected by operating system limits. For example, if you set MAXDATAFILES, Oracle Database allocates enough space in the control file to store MAXDATAFILES filenames, even if the database has only one datafile initially. However, because the maximum control file size is limited and operating system dependent, you might not be able to set all CREATE DATABASE parameters at their theoretical maximums.
For more information about setting limits during database creation, see the Oracle Database SQL Language Reference and your operating system–specific Oracle documentation.

The US7ASCII character set is used to store data in this database.

The AL16UTF16 character set is specified as the NATIONAL CHARACTER SET, used to store data in columns specifically defined as NCHAR, NCLOB, or NVARCHAR2.

The SYSTEM tablespace, consisting of the operating system file /u01/app/oracle/oradata/mynewdb/system01.dbf is created as specified by the DATAFILE clause. If a file with that name already exists, it is overwritten.

The SYSTEM tablespace is created as a locally managed tablespace. See "Creating a Locally Managed SYSTEM Tablespace".

A SYSAUX tablespace is created, consisting of the operating system file /u01/app/oracle/oradata/mynewdb/sysaux01.dbf as specified in the SYSAUX DATAFILE clause. See "About the SYSAUX Tablespace".

The DEFAULT TABLESPACE clause creates and names a default permanent tablespace for this database.

The DEFAULT TEMPORARY TABLESPACE clause creates and names a default temporary tablespace for this database. See "Creating a Default Temporary Tablespace".

The UNDO TABLESPACE clause creates and names an undo tablespace that is used to store undo data for this database if you have specified UNDO_MANAGEMENT=AUTO in the initialization parameter file. If you omit this parameter, it defaults to AUTO. See "Using Automatic Undo Management: Creating an Undo Tablespace".

Redo log files will not initially be archived, because the ARCHIVELOG clause is not specified in this CREATE DATABASE statement. This is customary during database creation. You can later use an ALTER DATABASE statement to switch to ARCHIVELOG mode. The initialization parameters in the initialization parameter file for mynewdb relating to archiving are LOG_ARCHIVE_DEST_1 and LOG_ARCHIVE_FORMAT. See Chapter 11, "Managing Archived Redo Logs".


Tips:

	Ensure that all directories used in the CREATE DATABASE statement exist. The CREATE DATABASE statement does not create directories.

	If you are not using Oracle-managed files, every tablespace clause must include a DATAFILE or TEMPFILE clause.

	If database creation fails, you can look at the alert log to determine the reason for the failure and to determine corrective actions. See "Viewing the Alert Log". If you receive an error message that contains a process number, examine the trace file for that process. Look for the trace file that contains the process number in the trace file name. See "Finding Trace Files" for more information.

	If you want to resubmit the CREATE DATABASE statement after a failure, you must first shut down the instance and delete any files created by the previous CREATE DATABASE statement.


**Example 2**

This example illustrates creating a database with Oracle Managed Files, which enables you to use a much simpler CREATE DATABASE statement. To use Oracle Managed Files, the initialization parameter DB_CREATE_FILE_DEST must be set. This parameter defines the base directory for the various database files that the database creates and automatically names. The following statement is an example of setting this parameter in the initialization parameter file, this parameter its on pfile.::

	DB_CREATE_FILE_DEST='/u01/app/oracle/oradata'

With Oracle Managed Files and the following CREATE DATABASE statement, the database creates the SYSTEM and SYSAUX tablespaces, creates the additional tablespaces specified in the statement, and chooses default sizes and properties for all datafiles, control files, and redo log files. Note that these properties and the other default database properties set by this method may not be suitable for your production environment, so it is recommended that you examine the resulting configuration and modify it if necessary.::

	CREATE DATABASE mynewdb2 USER SYS IDENTIFIED BY sys_password USER SYSTEM IDENTIFIED BY system_password EXTENT MANAGEMENT LOCAL DEFAULT TEMPORARY TABLESPACE temp UNDO TABLESPACE UNDOTBS1 DEFAULT TABLESPACE users;

Esto es lo mismo, pero esta formateado para hacerlo simple a la lectura.::

	CREATE DATABASE mynewdb2
	USER SYS IDENTIFIED BY sys_password
	USER SYSTEM IDENTIFIED BY system_password
	EXTENT MANAGEMENT LOCAL
	DEFAULT TEMPORARY TABLESPACE temp
	UNDO TABLESPACE UNDOTBS1
	DEFAULT TABLESPACE users;

Verify.::

	ps -ef | grep pmon
	oracle   10587     1  0 11:01 ?        00:03:21 ora_pmon_mynewdb
	oracle   10626     1  0 13:23 ?        00:00:00 ora_pmon_mynewdb2
	root     10910  1356  0 13:26 pts/0    00:00:00 grep --color=auto pmon



