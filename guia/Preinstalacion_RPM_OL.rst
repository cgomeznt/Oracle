Oracle Database 12c Pasos para la Simplificar la Preinstalación en Oracle Linux
==============================================================================

Oracle Linux incluye un práctico RPM para abordar el requisito de preinstalación de Oracle Database 12c. Comenzando con Oracle Database 12c Release 2, cambiamos el nombre de este RPM, por lo que el RPM que debe buscar depende de la versión de Oracle Database 12c que planea instalar:

* Para Oracle Database 12c Release 2: oracle-database-server-12cR2-preinstall
* Para Oracle Database 12c Release 1: oracle-rdbms-server-12cR1-preinstal


Ambos RPM están en el repositorio ol6_latest y ol7_latest para Oracle Linux 6 y 7 en el servidor yum de Oracle Linux, así como de ULN. Todas las versiones recientes de Oracle Linux 6 y 7 por defecto incluyen la configuración yum adecuada para instalar estos RPM.::

	$ yum info oracle-database-server-12cR2-preinstall
	Available Packages
	Name        : oracle-database-server-12cR2-preinstall
	Arch        : x86_64
	Version     : 1.0
	Release     : 3.el7
	Size        : 19 k
	Repo        : ol7_latest/x86_64
	Summary     : Sets the system for Oracle Database single instance and Real Application Cluster install for Oracle Linux 7
	License     : GPLv2
	Description : The Oracle Preinstallation RPM package installs software packages and sets system parameters required for Oracle
		    : Database single instance and Oracle Real Application Clusters installations for Oracle Linux Release 7 Files
		    : affected: /etc/sysctl.conf, /boot/grub/menu.lst OR /boot/grub2/grub.cfg Files added:
		    : /etc/security/limits.d/oracle-database-server-12cR2-preinstall.conf


El resultado a continuación es de una nueva instalación de Oracle Linux 7.4 para prepararse para Oracle Database 12c Release 2::

	$ sudo yum install oracle-database-server-12cR2-preinstall
	ol7_UEKR4                                                                                                   | 1.2 kB  00:00:00     
	ol7_addons                                                                                                  | 1.2 kB  00:00:00     
	ol7_latest                                                                                                  | 1.4 kB  00:00:00     
	(1/7): ol7_addons/x86_64/updateinfo                                                                         |  38 kB  00:00:00     
	(2/7): ol7_addons/x86_64/primary                                                                            |  75 kB  00:00:00     
	(3/7): ol7_UEKR4/x86_64/updateinfo                                                                          | 120 kB  00:00:00     
	(4/7): ol7_latest/x86_64/group                                                                              | 681 kB  00:00:01     
	(5/7): ol7_latest/x86_64/updateinfo                                                                         | 1.6 MB  00:00:02     
	(6/7): ol7_UEKR4/x86_64/primary                                                                             |  21 MB  00:00:28     
	(7/7): ol7_latest/x86_64/primary                                                                            |  30 MB  00:00:38     
	ol7_UEKR4                                                                                                                  437/437
	ol7_addons                                                                                                                 242/242
	ol7_latest                                                                                                             22789/22789
	Resolving Dependencies
	--> Running transaction check
	---> Package oracle-database-server-12cR2-preinstall.x86_64 0:1.0-3.el7 will be installed
	--> Processing Dependency: sysstat for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: xorg-x11-utils for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: bind-utils for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: compat-libcap1 for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: ksh for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: libaio-devel for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: xorg-x11-xauth for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: psmisc for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: unzip for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: glibc-devel for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: compat-libstdc++-33 for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: libstdc++-devel for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: nfs-utils for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Processing Dependency: smartmontools for package: oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64
	--> Running transaction check
	---> Package bind-utils.x86_64 32:9.9.4-51.el7 will be installed
	--> Processing Dependency: bind-libs = 32:9.9.4-51.el7 for package: 32:bind-utils-9.9.4-51.el7.x86_64
	--> Processing Dependency: libisccc.so.90()(64bit) for package: 32:bind-utils-9.9.4-51.el7.x86_64
	--> Processing Dependency: liblwres.so.90()(64bit) for package: 32:bind-utils-9.9.4-51.el7.x86_64
	--> Processing Dependency: libbind9.so.90()(64bit) for package: 32:bind-utils-9.9.4-51.el7.x86_64
	--> Processing Dependency: libisc.so.95()(64bit) for package: 32:bind-utils-9.9.4-51.el7.x86_64
	--> Processing Dependency: libdns.so.100()(64bit) for package: 32:bind-utils-9.9.4-51.el7.x86_64
	--> Processing Dependency: libisccfg.so.90()(64bit) for package: 32:bind-utils-9.9.4-51.el7.x86_64
	---> Package compat-libcap1.x86_64 0:1.10-7.el7 will be installed
	---> Package compat-libstdc++-33.x86_64 0:3.2.3-72.el7 will be installed
	---> Package glibc-devel.x86_64 0:2.17-196.el7 will be installed
	--> Processing Dependency: glibc-headers = 2.17-196.el7 for package: glibc-devel-2.17-196.el7.x86_64
	--> Processing Dependency: glibc-headers for package: glibc-devel-2.17-196.el7.x86_64
	---> Package ksh.x86_64 0:20120801-34.el7 will be installed
	---> Package libaio-devel.x86_64 0:0.3.109-13.el7 will be installed
	---> Package libstdc++-devel.x86_64 0:4.8.5-16.el7 will be installed
	---> Package nfs-utils.x86_64 1:1.3.0-0.48.0.1.el7 will be installed
	--> Processing Dependency: gssproxy >= 0.7.0-3 for package: 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64
	--> Processing Dependency: libtirpc >= 0.2.4-0.7 for package: 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64
	--> Processing Dependency: rpcbind for package: 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64
	--> Processing Dependency: keyutils for package: 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64
	--> Processing Dependency: quota for package: 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64
	--> Processing Dependency: libevent for package: 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64
	--> Processing Dependency: libnfsidmap for package: 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64
	--> Processing Dependency: libevent-2.0.so.5()(64bit) for package: 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64
	--> Processing Dependency: libtirpc.so.1()(64bit) for package: 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64
	--> Processing Dependency: libnfsidmap.so.0()(64bit) for package: 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64
	---> Package psmisc.x86_64 0:22.20-15.el7 will be installed
	---> Package smartmontools.x86_64 1:6.2-8.el7 will be installed
	--> Processing Dependency: mailx for package: 1:smartmontools-6.2-8.el7.x86_64
	---> Package sysstat.x86_64 0:10.1.5-12.el7 will be installed
	--> Processing Dependency: libsensors.so.4()(64bit) for package: sysstat-10.1.5-12.el7.x86_64
	---> Package unzip.x86_64 0:6.0-16.el7 will be installed
	---> Package xorg-x11-utils.x86_64 0:7.5-22.el7 will be installed
	--> Processing Dependency: libXext.so.6()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libXv.so.1()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libXtst.so.6()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libXrender.so.1()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libXxf86vm.so.1()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libXxf86misc.so.1()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libX11-xcb.so.1()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libXrandr.so.2()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libdmx.so.1()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libXinerama.so.1()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libX11.so.6()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libXxf86dga.so.1()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libxcb.so.1()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libxcb-shape.so.0()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	--> Processing Dependency: libXi.so.6()(64bit) for package: xorg-x11-utils-7.5-22.el7.x86_64
	---> Package xorg-x11-xauth.x86_64 1:1.0.9-1.el7 will be installed
	--> Processing Dependency: libXau.so.6()(64bit) for package: 1:xorg-x11-xauth-1.0.9-1.el7.x86_64
	--> Processing Dependency: libXmuu.so.1()(64bit) for package: 1:xorg-x11-xauth-1.0.9-1.el7.x86_64
	--> Running transaction check
	---> Package bind-libs.x86_64 32:9.9.4-51.el7 will be installed
	---> Package glibc-headers.x86_64 0:2.17-196.el7 will be installed
	--> Processing Dependency: kernel-headers >= 2.2.1 for package: glibc-headers-2.17-196.el7.x86_64
	--> Processing Dependency: kernel-headers for package: glibc-headers-2.17-196.el7.x86_64
	---> Package gssproxy.x86_64 0:0.7.0-4.el7 will be installed
	--> Processing Dependency: libref_array.so.1(REF_ARRAY_0.1.1)(64bit) for package: gssproxy-0.7.0-4.el7.x86_64
	--> Processing Dependency: libini_config.so.3(INI_CONFIG_1.1.0)(64bit) for package: gssproxy-0.7.0-4.el7.x86_64
	--> Processing Dependency: libini_config.so.3(INI_CONFIG_1.2.0)(64bit) for package: gssproxy-0.7.0-4.el7.x86_64
	--> Processing Dependency: libverto-module-base for package: gssproxy-0.7.0-4.el7.x86_64
	--> Processing Dependency: libini_config.so.3()(64bit) for package: gssproxy-0.7.0-4.el7.x86_64
	--> Processing Dependency: libbasicobjects.so.0()(64bit) for package: gssproxy-0.7.0-4.el7.x86_64
	--> Processing Dependency: libref_array.so.1()(64bit) for package: gssproxy-0.7.0-4.el7.x86_64
	--> Processing Dependency: libcollection.so.2()(64bit) for package: gssproxy-0.7.0-4.el7.x86_64
	---> Package keyutils.x86_64 0:1.5.8-3.el7 will be installed
	---> Package libX11.x86_64 0:1.6.5-1.el7 will be installed
	--> Processing Dependency: libX11-common >= 1.6.5-1.el7 for package: libX11-1.6.5-1.el7.x86_64
	---> Package libXau.x86_64 0:1.0.8-2.1.el7 will be installed
	---> Package libXext.x86_64 0:1.3.3-3.el7 will be installed
	---> Package libXi.x86_64 0:1.7.9-1.el7 will be installed
	---> Package libXinerama.x86_64 0:1.1.3-2.1.el7 will be installed
	---> Package libXmu.x86_64 0:1.1.2-2.el7 will be installed
	--> Processing Dependency: libXt.so.6()(64bit) for package: libXmu-1.1.2-2.el7.x86_64
	---> Package libXrandr.x86_64 0:1.5.1-2.el7 will be installed
	---> Package libXrender.x86_64 0:0.9.10-1.el7 will be installed
	---> Package libXtst.x86_64 0:1.2.3-1.el7 will be installed
	---> Package libXv.x86_64 0:1.0.11-1.el7 will be installed
	---> Package libXxf86dga.x86_64 0:1.1.4-2.1.el7 will be installed
	---> Package libXxf86misc.x86_64 0:1.0.3-7.1.el7 will be installed
	---> Package libXxf86vm.x86_64 0:1.1.4-1.el7 will be installed
	---> Package libdmx.x86_64 0:1.1.3-3.el7 will be installed
	---> Package libevent.x86_64 0:2.0.21-4.el7 will be installed
	---> Package libnfsidmap.x86_64 0:0.25-17.el7 will be installed
	---> Package libtirpc.x86_64 0:0.2.4-0.10.el7 will be installed
	---> Package libxcb.x86_64 0:1.12-1.el7 will be installed
	---> Package lm_sensors-libs.x86_64 0:3.4.0-4.20160601gitf9185e5.el7 will be installed
	---> Package mailx.x86_64 0:12.5-16.el7 will be installed
	---> Package quota.x86_64 1:4.01-14.el7 will be installed
	--> Processing Dependency: quota-nls = 1:4.01-14.el7 for package: 1:quota-4.01-14.el7.x86_64
	--> Processing Dependency: tcp_wrappers for package: 1:quota-4.01-14.el7.x86_64
	---> Package rpcbind.x86_64 0:0.2.0-42.el7 will be installed
	--> Running transaction check
	---> Package kernel-headers.x86_64 0:3.10.0-693.2.2.el7 will be installed
	---> Package libX11-common.noarch 0:1.6.5-1.el7 will be installed
	---> Package libXt.x86_64 0:1.1.5-3.el7 will be installed
	--> Processing Dependency: libICE.so.6()(64bit) for package: libXt-1.1.5-3.el7.x86_64
	--> Processing Dependency: libSM.so.6()(64bit) for package: libXt-1.1.5-3.el7.x86_64
	---> Package libbasicobjects.x86_64 0:0.1.1-27.el7 will be installed
	---> Package libcollection.x86_64 0:0.6.2-27.el7 will be installed
	---> Package libini_config.x86_64 0:1.3.0-27.el7 will be installed
	--> Processing Dependency: libpath_utils.so.1(PATH_UTILS_0.2.1)(64bit) for package: libini_config-1.3.0-27.el7.x86_64
	--> Processing Dependency: libpath_utils.so.1()(64bit) for package: libini_config-1.3.0-27.el7.x86_64
	---> Package libref_array.x86_64 0:0.1.5-27.el7 will be installed
	---> Package libverto-libevent.x86_64 0:0.2.5-4.el7 will be installed
	---> Package quota-nls.noarch 1:4.01-14.el7 will be installed
	---> Package tcp_wrappers.x86_64 0:7.6-77.el7 will be installed
	--> Running transaction check
	---> Package libICE.x86_64 0:1.0.9-9.el7 will be installed
	---> Package libSM.x86_64 0:1.2.2-2.el7 will be installed
	---> Package libpath_utils.x86_64 0:0.2.1-27.el7 will be installed
	--> Finished Dependency Resolution

	Dependencies Resolved

	===================================================================================================================================
	 Package                                         Arch           Version                                   Repository          Size
	===================================================================================================================================
	Installing:
	 oracle-database-server-12cR2-preinstall         x86_64         1.0-3.el7                                 ol7_latest          19 k
	Installing for dependencies:
	 bind-libs                                       x86_64         32:9.9.4-51.el7                           ol7_latest         1.0 M
	 bind-utils                                      x86_64         32:9.9.4-51.el7                           ol7_latest         203 k
	 compat-libcap1                                  x86_64         1.10-7.el7                                ol7_latest          17 k
	 compat-libstdc++-33                             x86_64         3.2.3-72.el7                              ol7_latest         190 k
	 glibc-devel                                     x86_64         2.17-196.el7                              ol7_latest         1.1 M
	 glibc-headers                                   x86_64         2.17-196.el7                              ol7_latest         675 k
	 gssproxy                                        x86_64         0.7.0-4.el7                               ol7_latest         104 k
	 kernel-headers                                  x86_64         3.10.0-693.2.2.el7                        ol7_latest         6.0 M
	 keyutils                                        x86_64         1.5.8-3.el7                               ol7_latest          53 k
	 ksh                                             x86_64         20120801-34.el7                           ol7_latest         883 k
	 libICE                                          x86_64         1.0.9-9.el7                               ol7_latest          66 k
	 libSM                                           x86_64         1.2.2-2.el7                               ol7_latest          39 k
	 libX11                                          x86_64         1.6.5-1.el7                               ol7_latest         606 k
	 libX11-common                                   noarch         1.6.5-1.el7                               ol7_latest         163 k
	 libXau                                          x86_64         1.0.8-2.1.el7                             ol7_latest          28 k
	 libXext                                         x86_64         1.3.3-3.el7                               ol7_latest          38 k
	 libXi                                           x86_64         1.7.9-1.el7                               ol7_latest          40 k
	 libXinerama                                     x86_64         1.1.3-2.1.el7                             ol7_latest          13 k
	 libXmu                                          x86_64         1.1.2-2.el7                               ol7_latest          70 k
	 libXrandr                                       x86_64         1.5.1-2.el7                               ol7_latest          27 k
	 libXrender                                      x86_64         0.9.10-1.el7                              ol7_latest          25 k
	 libXt                                           x86_64         1.1.5-3.el7                               ol7_latest         172 k
	 libXtst                                         x86_64         1.2.3-1.el7                               ol7_latest          20 k
	 libXv                                           x86_64         1.0.11-1.el7                              ol7_latest          18 k
	 libXxf86dga                                     x86_64         1.1.4-2.1.el7                             ol7_latest          18 k
	 libXxf86misc                                    x86_64         1.0.3-7.1.el7                             ol7_latest          19 k
	 libXxf86vm                                      x86_64         1.1.4-1.el7                               ol7_latest          17 k
	 libaio-devel                                    x86_64         0.3.109-13.el7                            ol7_latest          12 k
	 libbasicobjects                                 x86_64         0.1.1-27.el7                              ol7_latest          24 k
	 libcollection                                   x86_64         0.6.2-27.el7                              ol7_latest          40 k
	 libdmx                                          x86_64         1.1.3-3.el7                               ol7_latest          15 k
	 libevent                                        x86_64         2.0.21-4.el7                              ol7_latest         208 k
	 libini_config                                   x86_64         1.3.0-27.el7                              ol7_latest          62 k
	 libnfsidmap                                     x86_64         0.25-17.el7                               ol7_latest          49 k
	 libpath_utils                                   x86_64         0.2.1-27.el7                              ol7_latest          27 k
	 libref_array                                    x86_64         0.1.5-27.el7                              ol7_latest          26 k
	 libstdc++-devel                                 x86_64         4.8.5-16.el7                              ol7_latest         1.5 M
	 libtirpc                                        x86_64         0.2.4-0.10.el7                            ol7_latest          88 k
	 libverto-libevent                               x86_64         0.2.5-4.el7                               ol7_latest         8.2 k
	 libxcb                                          x86_64         1.12-1.el7                                ol7_latest         210 k
	 lm_sensors-libs                                 x86_64         3.4.0-4.20160601gitf9185e5.el7            ol7_latest          41 k
	 mailx                                           x86_64         12.5-16.el7                               ol7_latest         244 k
	 nfs-utils                                       x86_64         1:1.3.0-0.48.0.1.el7                      ol7_latest         398 k
	 psmisc                                          x86_64         22.20-15.el7                              ol7_latest         140 k
	 quota                                           x86_64         1:4.01-14.el7                             ol7_latest         178 k
	 quota-nls                                       noarch         1:4.01-14.el7                             ol7_latest          89 k
	 rpcbind                                         x86_64         0.2.0-42.el7                              ol7_latest          59 k
	 smartmontools                                   x86_64         1:6.2-8.el7                               ol7_latest         421 k
	 sysstat                                         x86_64         10.1.5-12.el7                             ol7_latest         309 k
	 tcp_wrappers                                    x86_64         7.6-77.el7                                ol7_latest          78 k
	 unzip                                           x86_64         6.0-16.el7                                ol7_latest         169 k
	 xorg-x11-utils                                  x86_64         7.5-22.el7                                ol7_latest         113 k
	 xorg-x11-xauth                                  x86_64         1:1.0.9-1.el7                             ol7_latest          29 k

	Transaction Summary
	===================================================================================================================================
	Install  1 Package (+53 Dependent packages)

	Total download size: 16 M
	Installed size: 35 M
	Is this ok [y/d/N]: y
	Downloading packages:
	(1/54): bind-utils-9.9.4-51.el7.x86_64.rpm                                                                  | 203 kB  00:00:00     
	(2/54): compat-libcap1-1.10-7.el7.x86_64.rpm                                                                |  17 kB  00:00:00     
	(3/54): compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm                                                         | 190 kB  00:00:00     
	(4/54): bind-libs-9.9.4-51.el7.x86_64.rpm                                                                   | 1.0 MB  00:00:01     
	(5/54): glibc-devel-2.17-196.el7.x86_64.rpm                                                                 | 1.1 MB  00:00:01     
	(6/54): gssproxy-0.7.0-4.el7.x86_64.rpm                                                                     | 104 kB  00:00:00     
	(7/54): glibc-headers-2.17-196.el7.x86_64.rpm                                                               | 675 kB  00:00:00     
	(8/54): keyutils-1.5.8-3.el7.x86_64.rpm                                                                     |  53 kB  00:00:00     
	(9/54): ksh-20120801-34.el7.x86_64.rpm                                                                      | 883 kB  00:00:01     
	(10/54): libICE-1.0.9-9.el7.x86_64.rpm                                                                      |  66 kB  00:00:00     
	(11/54): libSM-1.2.2-2.el7.x86_64.rpm                                                                       |  39 kB  00:00:00     
	(12/54): libX11-1.6.5-1.el7.x86_64.rpm                                                                      | 606 kB  00:00:00     
	(13/54): libX11-common-1.6.5-1.el7.noarch.rpm                                                               | 163 kB  00:00:00     
	(14/54): libXau-1.0.8-2.1.el7.x86_64.rpm                                                                    |  28 kB  00:00:00     
	(15/54): libXext-1.3.3-3.el7.x86_64.rpm                                                                     |  38 kB  00:00:00     
	(16/54): libXi-1.7.9-1.el7.x86_64.rpm                                                                       |  40 kB  00:00:00     
	(17/54): libXinerama-1.1.3-2.1.el7.x86_64.rpm                                                               |  13 kB  00:00:00     
	(18/54): libXmu-1.1.2-2.el7.x86_64.rpm                                                                      |  70 kB  00:00:00     
	(19/54): libXrandr-1.5.1-2.el7.x86_64.rpm                                                                   |  27 kB  00:00:00     
	(20/54): libXrender-0.9.10-1.el7.x86_64.rpm                                                                 |  25 kB  00:00:00     
	(21/54): libXt-1.1.5-3.el7.x86_64.rpm                                                                       | 172 kB  00:00:00     
	(22/54): libXtst-1.2.3-1.el7.x86_64.rpm                                                                     |  20 kB  00:00:00     
	(23/54): libXv-1.0.11-1.el7.x86_64.rpm                                                                      |  18 kB  00:00:00     
	(24/54): libXxf86dga-1.1.4-2.1.el7.x86_64.rpm                                                               |  18 kB  00:00:00     
	(25/54): libXxf86misc-1.0.3-7.1.el7.x86_64.rpm                                                              |  19 kB  00:00:00     
	(26/54): libXxf86vm-1.1.4-1.el7.x86_64.rpm                                                                  |  17 kB  00:00:00     
	(27/54): libaio-devel-0.3.109-13.el7.x86_64.rpm                                                             |  12 kB  00:00:00     
	(28/54): libbasicobjects-0.1.1-27.el7.x86_64.rpm                                                            |  24 kB  00:00:00     
	(29/54): libcollection-0.6.2-27.el7.x86_64.rpm                                                              |  40 kB  00:00:00     
	(30/54): libdmx-1.1.3-3.el7.x86_64.rpm                                                                      |  15 kB  00:00:00     
	(31/54): libevent-2.0.21-4.el7.x86_64.rpm                                                                   | 208 kB  00:00:00     
	(32/54): libini_config-1.3.0-27.el7.x86_64.rpm                                                              |  62 kB  00:00:00     
	(33/54): libnfsidmap-0.25-17.el7.x86_64.rpm                                                                 |  49 kB  00:00:00     
	(34/54): libpath_utils-0.2.1-27.el7.x86_64.rpm                                                              |  27 kB  00:00:00     
	(35/54): libref_array-0.1.5-27.el7.x86_64.rpm                                                               |  26 kB  00:00:00     
	(36/54): kernel-headers-3.10.0-693.2.2.el7.x86_64.rpm                                                       | 6.0 MB  00:00:07     
	(37/54): libtirpc-0.2.4-0.10.el7.x86_64.rpm                                                                 |  88 kB  00:00:00     
	(38/54): libstdc++-devel-4.8.5-16.el7.x86_64.rpm                                                            | 1.5 MB  00:00:01     
	(39/54): libverto-libevent-0.2.5-4.el7.x86_64.rpm                                                           | 8.2 kB  00:00:00     
	(40/54): lm_sensors-libs-3.4.0-4.20160601gitf9185e5.el7.x86_64.rpm                                          |  41 kB  00:00:00     
	(41/54): libxcb-1.12-1.el7.x86_64.rpm                                                                       | 210 kB  00:00:00     
	(42/54): mailx-12.5-16.el7.x86_64.rpm                                                                       | 244 kB  00:00:00     
	(43/54): oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64.rpm                                       |  19 kB  00:00:00     
	(44/54): psmisc-22.20-15.el7.x86_64.rpm                                                                     | 140 kB  00:00:00     
	(45/54): nfs-utils-1.3.0-0.48.0.1.el7.x86_64.rpm                                                            | 398 kB  00:00:00     
	(46/54): quota-nls-4.01-14.el7.noarch.rpm                                                                   |  89 kB  00:00:00     
	(47/54): quota-4.01-14.el7.x86_64.rpm                                                                       | 178 kB  00:00:00     
	(48/54): rpcbind-0.2.0-42.el7.x86_64.rpm                                                                    |  59 kB  00:00:00     
	(49/54): sysstat-10.1.5-12.el7.x86_64.rpm                                                                   | 309 kB  00:00:00     
	(50/54): smartmontools-6.2-8.el7.x86_64.rpm                                                                 | 421 kB  00:00:00     
	(51/54): tcp_wrappers-7.6-77.el7.x86_64.rpm                                                                 |  78 kB  00:00:00     
	(52/54): xorg-x11-utils-7.5-22.el7.x86_64.rpm                                                               | 113 kB  00:00:00     
	(53/54): unzip-6.0-16.el7.x86_64.rpm                                                                        | 169 kB  00:00:00     
	(54/54): xorg-x11-xauth-1.0.9-1.el7.x86_64.rpm                                                              |  29 kB  00:00:00     
	-----------------------------------------------------------------------------------------------------------------------------------
	Total                                                                                              1.3 MB/s |  16 MB  00:00:11     
	Running transaction check
	Running transaction test
	Transaction test succeeded
	Running transaction
	  Installing : libcollection-0.6.2-27.el7.x86_64                                                                              1/54 
	  Installing : libXau-1.0.8-2.1.el7.x86_64                                                                                    2/54 
	  Installing : libxcb-1.12-1.el7.x86_64                                                                                       3/54 
	  Installing : libtirpc-0.2.4-0.10.el7.x86_64                                                                                 4/54 
	  Installing : rpcbind-0.2.0-42.el7.x86_64                                                                                    5/54 
	  Installing : libevent-2.0.21-4.el7.x86_64                                                                                   6/54 
	  Installing : libref_array-0.1.5-27.el7.x86_64                                                                               7/54 
	  Installing : libbasicobjects-0.1.1-27.el7.x86_64                                                                            8/54 
	  Installing : libICE-1.0.9-9.el7.x86_64                                                                                      9/54 
	  Installing : libSM-1.2.2-2.el7.x86_64                                                                                      10/54 
	  Installing : libverto-libevent-0.2.5-4.el7.x86_64                                                                          11/54 
	  Installing : libpath_utils-0.2.1-27.el7.x86_64                                                                             12/54 
	  Installing : libini_config-1.3.0-27.el7.x86_64                                                                             13/54 
	  Installing : gssproxy-0.7.0-4.el7.x86_64                                                                                   14/54 
	  Installing : tcp_wrappers-7.6-77.el7.x86_64                                                                                15/54 
	  Installing : compat-libstdc++-33-3.2.3-72.el7.x86_64                                                                       16/54 
	  Installing : keyutils-1.5.8-3.el7.x86_64                                                                                   17/54 
	  Installing : mailx-12.5-16.el7.x86_64                                                                                      18/54 
	  Installing : 1:smartmontools-6.2-8.el7.x86_64                                                                              19/54 
	  Installing : libX11-common-1.6.5-1.el7.noarch                                                                              20/54 
	  Installing : libX11-1.6.5-1.el7.x86_64                                                                                     21/54 
	  Installing : libXext-1.3.3-3.el7.x86_64                                                                                    22/54 
	  Installing : libXi-1.7.9-1.el7.x86_64                                                                                      23/54 
	  Installing : libXrender-0.9.10-1.el7.x86_64                                                                                24/54 
	  Installing : libXrandr-1.5.1-2.el7.x86_64                                                                                  25/54 
	  Installing : libXtst-1.2.3-1.el7.x86_64                                                                                    26/54 
	  Installing : libXxf86misc-1.0.3-7.1.el7.x86_64                                                                             27/54 
	  Installing : libXinerama-1.1.3-2.1.el7.x86_64                                                                              28/54 
	  Installing : libXv-1.0.11-1.el7.x86_64                                                                                     29/54 
	  Installing : libXxf86vm-1.1.4-1.el7.x86_64                                                                                 30/54 
	  Installing : libdmx-1.1.3-3.el7.x86_64                                                                                     31/54 
	  Installing : libXxf86dga-1.1.4-2.1.el7.x86_64                                                                              32/54 
	  Installing : xorg-x11-utils-7.5-22.el7.x86_64                                                                              33/54 
	  Installing : libXt-1.1.5-3.el7.x86_64                                                                                      34/54 
	  Installing : libXmu-1.1.2-2.el7.x86_64                                                                                     35/54 
	  Installing : 1:xorg-x11-xauth-1.0.9-1.el7.x86_64                                                                           36/54 
	  Installing : 32:bind-libs-9.9.4-51.el7.x86_64                                                                              37/54 
	  Installing : 32:bind-utils-9.9.4-51.el7.x86_64                                                                             38/54 
	  Installing : psmisc-22.20-15.el7.x86_64                                                                                    39/54 
	  Installing : libaio-devel-0.3.109-13.el7.x86_64                                                                            40/54 
	  Installing : compat-libcap1-1.10-7.el7.x86_64                                                                              41/54 
	  Installing : libnfsidmap-0.25-17.el7.x86_64                                                                                42/54 
	  Installing : libstdc++-devel-4.8.5-16.el7.x86_64                                                                           43/54 
	  Installing : 1:quota-nls-4.01-14.el7.noarch                                                                                44/54 
	  Installing : 1:quota-4.01-14.el7.x86_64                                                                                    45/54 
	  Installing : 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64                                                                         46/54 
	  Installing : unzip-6.0-16.el7.x86_64                                                                                       47/54 
	  Installing : ksh-20120801-34.el7.x86_64                                                                                    48/54 
	  Installing : lm_sensors-libs-3.4.0-4.20160601gitf9185e5.el7.x86_64                                                         49/54 
	  Installing : sysstat-10.1.5-12.el7.x86_64                                                                                  50/54 
	  Installing : kernel-headers-3.10.0-693.2.2.el7.x86_64                                                                      51/54 
	  Installing : glibc-headers-2.17-196.el7.x86_64                                                                             52/54 
	  Installing : glibc-devel-2.17-196.el7.x86_64                                                                               53/54 
	  Installing : oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64                                                      54/54 
	  Verifying  : libXext-1.3.3-3.el7.x86_64                                                                                     1/54 
	  Verifying  : libX11-1.6.5-1.el7.x86_64                                                                                      2/54 
	  Verifying  : libXxf86misc-1.0.3-7.1.el7.x86_64                                                                              3/54 
	  Verifying  : 1:quota-4.01-14.el7.x86_64                                                                                     4/54 
	  Verifying  : libICE-1.0.9-9.el7.x86_64                                                                                      5/54 
	  Verifying  : 1:nfs-utils-1.3.0-0.48.0.1.el7.x86_64                                                                          6/54 
	  Verifying  : libXinerama-1.1.3-2.1.el7.x86_64                                                                               7/54 
	  Verifying  : kernel-headers-3.10.0-693.2.2.el7.x86_64                                                                       8/54 
	  Verifying  : libXrender-0.9.10-1.el7.x86_64                                                                                 9/54 
	  Verifying  : lm_sensors-libs-3.4.0-4.20160601gitf9185e5.el7.x86_64                                                         10/54 
	  Verifying  : libXv-1.0.11-1.el7.x86_64                                                                                     11/54 
	  Verifying  : libXi-1.7.9-1.el7.x86_64                                                                                      12/54 
	  Verifying  : libXxf86vm-1.1.4-1.el7.x86_64                                                                                 13/54 
	  Verifying  : libdmx-1.1.3-3.el7.x86_64                                                                                     14/54 
	  Verifying  : libXt-1.1.5-3.el7.x86_64                                                                                      15/54 
	  Verifying  : ksh-20120801-34.el7.x86_64                                                                                    16/54 
	  Verifying  : unzip-6.0-16.el7.x86_64                                                                                       17/54 
	  Verifying  : 1:quota-nls-4.01-14.el7.noarch                                                                                18/54 
	  Verifying  : xorg-x11-utils-7.5-22.el7.x86_64                                                                              19/54 
	  Verifying  : libbasicobjects-0.1.1-27.el7.x86_64                                                                           20/54 
	  Verifying  : libstdc++-devel-4.8.5-16.el7.x86_64                                                                           21/54 
	  Verifying  : 1:smartmontools-6.2-8.el7.x86_64                                                                              22/54 
	  Verifying  : libXtst-1.2.3-1.el7.x86_64                                                                                    23/54 
	  Verifying  : glibc-headers-2.17-196.el7.x86_64                                                                             24/54 
	  Verifying  : gssproxy-0.7.0-4.el7.x86_64                                                                                   25/54 
	  Verifying  : glibc-devel-2.17-196.el7.x86_64                                                                               26/54 
	  Verifying  : libini_config-1.3.0-27.el7.x86_64                                                                             27/54 
	  Verifying  : 32:bind-utils-9.9.4-51.el7.x86_64                                                                             28/54 
	  Verifying  : libref_array-0.1.5-27.el7.x86_64                                                                              29/54 
	  Verifying  : libnfsidmap-0.25-17.el7.x86_64                                                                                30/54 
	  Verifying  : libxcb-1.12-1.el7.x86_64                                                                                      31/54 
	  Verifying  : libevent-2.0.21-4.el7.x86_64                                                                                  32/54 
	  Verifying  : libverto-libevent-0.2.5-4.el7.x86_64                                                                          33/54 
	  Verifying  : compat-libcap1-1.10-7.el7.x86_64                                                                              34/54 
	  Verifying  : libXrandr-1.5.1-2.el7.x86_64                                                                                  35/54 
	  Verifying  : libaio-devel-0.3.109-13.el7.x86_64                                                                            36/54 
	  Verifying  : libtirpc-0.2.4-0.10.el7.x86_64                                                                                37/54 
	  Verifying  : psmisc-22.20-15.el7.x86_64                                                                                    38/54 
	  Verifying  : 1:xorg-x11-xauth-1.0.9-1.el7.x86_64                                                                           39/54 
	  Verifying  : 32:bind-libs-9.9.4-51.el7.x86_64                                                                              40/54 
	  Verifying  : libX11-common-1.6.5-1.el7.noarch                                                                              41/54 
	  Verifying  : rpcbind-0.2.0-42.el7.x86_64                                                                                   42/54 
	  Verifying  : mailx-12.5-16.el7.x86_64                                                                                      43/54 
	  Verifying  : libXau-1.0.8-2.1.el7.x86_64                                                                                   44/54 
	  Verifying  : libSM-1.2.2-2.el7.x86_64                                                                                      45/54 
	  Verifying  : libXxf86dga-1.1.4-2.1.el7.x86_64                                                                              46/54 
	  Verifying  : libXmu-1.1.2-2.el7.x86_64                                                                                     47/54 
	  Verifying  : keyutils-1.5.8-3.el7.x86_64                                                                                   48/54 
	  Verifying  : compat-libstdc++-33-3.2.3-72.el7.x86_64                                                                       49/54 
	  Verifying  : tcp_wrappers-7.6-77.el7.x86_64                                                                                50/54 
	  Verifying  : libpath_utils-0.2.1-27.el7.x86_64                                                                             51/54 
	  Verifying  : oracle-database-server-12cR2-preinstall-1.0-3.el7.x86_64                                                      52/54 
	  Verifying  : sysstat-10.1.5-12.el7.x86_64                                                                                  53/54 
	  Verifying  : libcollection-0.6.2-27.el7.x86_64                                                                             54/54 

	Installed:
	  oracle-database-server-12cR2-preinstall.x86_64 0:1.0-3.el7                                                                       

	Dependency Installed:
	  bind-libs.x86_64 32:9.9.4-51.el7                                       bind-utils.x86_64 32:9.9.4-51.el7                        
	  compat-libcap1.x86_64 0:1.10-7.el7                                     compat-libstdc++-33.x86_64 0:3.2.3-72.el7                
	  glibc-devel.x86_64 0:2.17-196.el7                                      glibc-headers.x86_64 0:2.17-196.el7                      
	  gssproxy.x86_64 0:0.7.0-4.el7                                          kernel-headers.x86_64 0:3.10.0-693.2.2.el7               
	  keyutils.x86_64 0:1.5.8-3.el7                                          ksh.x86_64 0:20120801-34.el7                             
	  libICE.x86_64 0:1.0.9-9.el7                                            libSM.x86_64 0:1.2.2-2.el7                               
	  libX11.x86_64 0:1.6.5-1.el7                                            libX11-common.noarch 0:1.6.5-1.el7                       
	  libXau.x86_64 0:1.0.8-2.1.el7                                          libXext.x86_64 0:1.3.3-3.el7                             
	  libXi.x86_64 0:1.7.9-1.el7                                             libXinerama.x86_64 0:1.1.3-2.1.el7                       
	  libXmu.x86_64 0:1.1.2-2.el7                                            libXrandr.x86_64 0:1.5.1-2.el7                           
	  libXrender.x86_64 0:0.9.10-1.el7                                       libXt.x86_64 0:1.1.5-3.el7                               
	  libXtst.x86_64 0:1.2.3-1.el7                                           libXv.x86_64 0:1.0.11-1.el7                              
	  libXxf86dga.x86_64 0:1.1.4-2.1.el7                                     libXxf86misc.x86_64 0:1.0.3-7.1.el7                      
	  libXxf86vm.x86_64 0:1.1.4-1.el7                                        libaio-devel.x86_64 0:0.3.109-13.el7                     
	  libbasicobjects.x86_64 0:0.1.1-27.el7                                  libcollection.x86_64 0:0.6.2-27.el7                      
	  libdmx.x86_64 0:1.1.3-3.el7                                            libevent.x86_64 0:2.0.21-4.el7                           
	  libini_config.x86_64 0:1.3.0-27.el7                                    libnfsidmap.x86_64 0:0.25-17.el7                         
	  libpath_utils.x86_64 0:0.2.1-27.el7                                    libref_array.x86_64 0:0.1.5-27.el7                       
	  libstdc++-devel.x86_64 0:4.8.5-16.el7                                  libtirpc.x86_64 0:0.2.4-0.10.el7                         
	  libverto-libevent.x86_64 0:0.2.5-4.el7                                 libxcb.x86_64 0:1.12-1.el7                               
	  lm_sensors-libs.x86_64 0:3.4.0-4.20160601gitf9185e5.el7                mailx.x86_64 0:12.5-16.el7                               
	  nfs-utils.x86_64 1:1.3.0-0.48.0.1.el7                                  psmisc.x86_64 0:22.20-15.el7                             
	  quota.x86_64 1:4.01-14.el7                                             quota-nls.noarch 1:4.01-14.el7                           
	  rpcbind.x86_64 0:0.2.0-42.el7                                          smartmontools.x86_64 1:6.2-8.el7                         
	  sysstat.x86_64 0:10.1.5-12.el7                                         tcp_wrappers.x86_64 0:7.6-77.el7                         
	  unzip.x86_64 0:6.0-16.el7                                              xorg-x11-utils.x86_64 0:7.5-22.el7                       
	  xorg-x11-xauth.x86_64 1:1.0.9-1.el7                                   

	Complete!


Puede revisar todas las acciones realizadas por el RPM previo a la instalación en un archivo de registro ubicado aquí::

	 /var/log/oracle-database-server-12cR2-preinstall/results/orakernel.log 

Referencia
+++++++++++++++

https://docs.oracle.com/en/database/oracle/oracle-database/12.2/ladbi/automatically-configuring-oracle-linux-with-oracle-preinstallation-rpm.html#GUID-22846194-58EF-4552-AAC3-6F6D0A1DF794
