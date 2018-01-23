**Actividad 1**

**Sistemas Distribuidos**

**Christian Cárdenas A00212740**

**Luis F. Rosales A00315320**

Se instalo CentOS 7 15.11 x64 bits con las siguientes caracteristicas:

HDD 20 GB
1.Interfaz de red tipo Bridge
se configuro un usuario sin privilegios llamado distribuidos 

Para instalar un servidor web se deben seguir los siguientes comandos desde usuario root:


1. listamos las interfaces con el comando
```
	ip a
```	
2. configuramos la interfaz tipo Bridge modificando el archivo ifcfg-ens37 ubicado en
/etc/sysconfig/network-scripts/ifcfg-ens37

```	
	TYPE=Ethernet
	BOOTPROTO=none
	IPADDR=192.168.130.125
	PREFIX=24
	GATEWAY=192.168.130.1
	DNS1=192.168.170.20
	IPV4_FAILURE_FATAL=no
	IPV6INIT=no
	NAME=ens37
	UUID=b571952e-407b-4f41-b043-728589bea0a1
	DEVICE=ens37
	ONBOOT=yes
```
	
3. reiniamos la maquina virtual para que aplique los cambios realizados

4. luego actualizamos el repositorio de paquetes e instalamos el servidor web con los comandos:
	sudo yum update
	sudo yum install httpd -y 
5. configuramos el firewall y abrimos los puertos 80 y 8080 para el servidor web
```
	firewall-cmd --zone=public --add-port=80/tcp --permanent
	firewall-cmd --zone=public --add-port=8080/tcp --permanent 
	firewall-cmd --reload
```
6. creamos  el archivo html index ubicado en /var/www/html y añadimos una pagina web sencilla

7. Finalmente subimos el servicio de httpd con el comando
```
	service httpd start
```	
