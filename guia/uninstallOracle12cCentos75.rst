Desinstalar Oracle 12c en CentOS 7.5
========================================

El Oracle 12c trae su utilidad que ejecuta de forma nativa la desinstalación del Oracle 12c y todos sus componentes.::

	$ $ORACLE:HOME/deinstall/deinstall

	Checking for required files and bootstrapping ...
	Please wait ...
	Ubicación de logs /tmp/deinstall2018-10-09_10-08-43AM/logs/

	############ ORACLE DECONFIG TOOL START ############


	######################### DECONFIG CHECK OPERATION START #########################
	## [START] Install check configuration ##


	Comprobando la existencia de la ubicación del directorio raíz de Oracle /u01/app/oracle/product/12.2.0/dbhome_1
	El tipo de directorio raíz de Oracle seleccionado para la desinstalación es: Base de Datos de Instancia Única Oracle
	El directorio base de Oracle seleccionado para la desinstalación es: /u01/app/oracle
	Comprobando la existencia de la ubicación del inventario central /u01/app/oraInventory

	## [END] Install check configuration ##


	INICIO de configuración de comprobación de configuración de red

	Ubicación del archivo de rastreo de anulación de la configuración de red: /tmp/deinstall2018-10-09_10-08-43AM/logs/netdc_check09-10-2018_10-10-16-AM.log

	Especifique todos los listeners de instancia única cuya configuración se va a anular. Introduzca . (punto) para anular la selección de todo. [LISTENER]:.

	Falta al menos uno de los listeners de la lista de listeners detectados [LISTENER] en la lista de listeners especificados []. Se limpiará el directorio raíz de Oracle, por lo que no todos los listeners estarán disponibles después de la desinstalación. Si desea eliminar un listener específico, utilice el Asistente de Configuración de Red de Oracle. ¿Desea continuar? (s|n) [n]: y

	FINALIZACIÓN de configuración de comprobación de configuración de red

	INICIO de Configuración de Comprobación de Base de Datos

	Ubicación del archivo de rastreo de anulación de configuración de base de datos: /tmp/deinstall2018-10-09_10-08-43AM/logs/databasedc_check09-10-2018_10-11-03-AM.log

	Utilice la coma como separador al especificar la lista de valores como entrada

	Especifique la lista de nombres de base de datos que se han configurado en este directorio raíz de Oracle [orcl12c]: 

	###### Para Base de Datos 'orcl12c' ######

	Base de Datos de Instancia Única
	Ubicación de destino de diagnóstico de la base de datos: /u01/app/oracle/diag/rdbms/orcl12c
	Tipo de almacenamiento que utiliza la base de datos: FS
	Ubicación de archivos de base de datos: /u01/app/oracle/oradata/orcl12c
	Ubicación del área de recuperación rápida: No existe
	ubicación de spfile de base de datos: /u01/app/oracle/product/12.2.0/dbhome_1/dbs/spfileorcl12c.ora

	Se han detectado automáticamente los detalles de las bases de datos orcl12c. ¿Aún desea modificar los detalles de las bases de datos orcl12c? [n]: 

	FINALIZACIÓN  de Configuración de Comprobación de Base de Datos
	Oracle Configuration Manager check START
	Ubicación del archivo log de comprobación de OCM: /tmp/deinstall2018-10-09_10-08-43AM/logs//ocm_check3579.log
	Oracle Configuration Manager check END

	######################### DECONFIG CHECK OPERATION END #########################


	####################### DECONFIG CHECK OPERATION SUMMARY #######################
	El directorio raíz de Oracle seleccionado para la desinstalación es: /u01/app/oracle/product/12.2.0/dbhome_1
	La ubicación de inventario en la que se ha registrado el directorio raíz de Oracle es: /u01/app/oraInventory
	Se han seleccionado las siguientes bases de datos para anular su configuración: orcl12c
	Nombre único de la base de datos: orcl12c
	Almacenamiento utilizado: FS
	Comprobando el estado de configuración de CCR
	El directorio raíz de Oracle existe con el directorio de CCR, pero CCR no está configurado
	Ha terminado la comprobación de CCR
	¿Desea continuar? (y - Sí, n - No) [n]: y
	Se escribirá un log de esta sesión en: '/tmp/deinstall2018-10-09_10-08-43AM/logs/deinstall_deconfig2018-10-09_10-10-11-AM.out'
	Los mensajes de error de esta sesión se escribirán en: '/tmp/deinstall2018-10-09_10-08-43AM/logs/deinstall_deconfig2018-10-09_10-10-11-AM.err'

	######################## DECONFIG CLEAN OPERATION START ########################
	Ubicación del archivo de rastreo de anulación de configuración de base de datos: /tmp/deinstall2018-10-09_10-08-43AM/logs/databasedc_clean09-10-2018_10-13-25-AM.log
	INICIO de Configuración de Limpieza de Base de Datos orcl12c
	Esta operación podría tardar unos minutos.
	FINALIZACIÓN de Configuración de Limpieza de Base de Datos orcl12c

	INICIO de configuración de limpieza de configuración de red

	Ubicación del archivo de rastreo de anulación de la configuración de red: /tmp/deinstall2018-10-09_10-08-43AM/logs/netdc_clean09-10-2018_10-15-24-AM.log

	Anulando la configuración del archivo de configuración del listener...
	La configuración del archivo de configuración del listener se ha anulado correctamente.

	Anulando la configuración del archivo de configuración de métodos de nomenclatura...
	La configuración del archivo de configuración de métodos de nomenclatura se ha anulado correctamente.

	Anulando la configuración del archivo de configuración de nombres de servicio de red local...
	La configuración del archivo de configuración de nombres de servicio de red local se ha anulado correctamente.

	Anulando la configuración de los archivos de copia de seguridad...
	La configuración de los archivos de copia de seguridad se ha anulado correctamente.

	La configuración de red se ha limpiado correctamente.

	FINALIZACIÓN de configuración de limpieza de configuración de red

	Oracle Configuration Manager clean START
	Ubicación del archivo log de limpieza de OCM: /tmp/deinstall2018-10-09_10-08-43AM/logs//ocm_clean3579.log
	Oracle Configuration Manager clean END

	######################### DECONFIG CLEAN OPERATION END #########################


	####################### DECONFIG CLEAN OPERATION SUMMARY #######################
	La anulación de la configuración de las siguientes instancias de base de datos se ha realizado correctamente: orcl12c
	Limpiando la configuración de CCR
	CCR no está configurado, saltando la limpieza de la configuración de CCR
	Ha terminado la limpieza de CCR
	#######################################################################


	############# ORACLE DECONFIG TOOL END #############

	Utilizando el archivo de propiedades /tmp/deinstall2018-10-09_10-08-43AM/response/deinstall_2018-10-09_10-10-11-AM.rsp
	Ubicación de logs /tmp/deinstall2018-10-09_10-08-43AM/logs/

	############ ORACLE DEINSTALL TOOL START ############





	####################### DEINSTALL CHECK OPERATION SUMMARY #######################
	Se escribirá un log de esta sesión en: '/tmp/deinstall2018-10-09_10-08-43AM/logs/deinstall_deconfig2018-10-09_10-10-11-AM.out'
	Los mensajes de error de esta sesión se escribirán en: '/tmp/deinstall2018-10-09_10-08-43AM/logs/deinstall_deconfig2018-10-09_10-10-11-AM.err'

	######################## DEINSTALL CLEAN OPERATION START ########################
	## [START] Preparándose para Desinstalar ##
	Definiendo LOCAL_NODE en localhost
	Definiendo CRS_HOME en false
	Definiendo oracle.installer.invPtrLoc en /tmp/deinstall2018-10-09_10-08-43AM/oraInst.loc
	Definiendo oracle.installer.local en false

	## [END] Preparándose para Desinstalar ##

	Setting the force flag to false
	Setting the force flag to cleanup the Oracle Base
	Inicio de Limpieza de Oracle Universal Installer

	Desconectar el directorio raíz de Oracle '/u01/app/oracle/product/12.2.0/dbhome_1' del inventario central en el nodo local : Listo

	Suprimir el directorio '/u01/app/oracle/product/12.2.0/dbhome_1' en el nodo local : Listo

	Suprimir el directorio '/u01/app/oraInventory' en el nodo local : Listo

	El directorio base de Oracle '/u01/app/oracle' no se eliminará en el nodo local. El directorio no está vacío.

	La limpieza de Oracle Universal Installer se ha realizado correctamente.

	Fin de Limpieza de Oracle Universal Installer


	## [START] Oracle install clean ##


	## [END] Oracle install clean ##


	######################### DEINSTALL CLEAN OPERATION END #########################


	####################### DEINSTALL CLEAN OPERATION SUMMARY #######################
	Se ha desconectado correctamente el directorio raíz de Oracle '/u01/app/oracle/product/12.2.0/dbhome_1' del inventario central en el nodo local.
	Se ha suprimido correctamente el directorio '/u01/app/oracle/product/12.2.0/dbhome_1' en el nodo local.
	Se ha suprimido correctamente el directorio '/u01/app/oraInventory' en el nodo local.
	La limpieza de Oracle Universal Installer se ha realizado correctamente.


	Ejecute 'rm -r /etc/oraInst.loc' como raíz en los nodos 'localhost' al final de la sesión.

	Ejecute 'rm -r /opt/ORCLfmap' como raíz en los nodos 'localhost' al final de la sesión.
	Ejecute 'rm -r /etc/oratab' como raíz en los nodos 'localhost' al final de la sesión.
	Revise los permisos y el contenido de '/u01/app/oracle' en los nodos 'localhost'.
	Si no hay ningún directorio raíz de Oracle asociado a '/u01/app/oracle', suprima manualmente '/u01/app/oracle' y su contenido.
	La herramienta de desinstalación de Oracle ha limpiado correctamente los directorios temporales.
	#######################################################################


	############# ORACLE DEINSTALL TOOL END #############

