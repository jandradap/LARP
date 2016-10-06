# LARP
#### **LARP: Linux, Apache, Redis, PHP.**


### Uso
	docker pull jorgeandrada/larp
	docker run --name=larp -p 8080:80  -h larp -d jorgeandrada/larp
	docker exec -it larp /bin/bash

### Uso con volumen
	docker pull jorgeandrada/larp
	sudo mkdir /srv/apache
	sudo mkdir /srv/redis
	sudo chmod -R 777 /srv/redis
	docker run --name=larp -p 8080:80 -v /srv/apache:/var/www/html -v /srv/redis:/var/lib/redis -h larp -d jorgeandrada/larp
	docker exec -it larp /bin/bash

### Realización de pruebas en Redis

	fecha=$(date +%Y-%m-%d:%H:%M:%S)
	redis-cli SET fecha $fecha
	redis-cli get fecha
	"2016-10-05:16:23:06"

	redis-cli RPUSH nodos pve01a11

	redis-cli LRANGE nodos 0 -1
	 1) "'pve01a11'"
	 2) "'pve02a11'"
	 3) "'pve02b11'"
	 4) "'pve03b11'"
	 5) "'pve01b11'"
	 6) "'pve01d11'"
	 7) "'pve03d11'"
	 8) "'pve02d11'"
	 9) "'pve04d11'"
	10) "'pve01z11'"
	11) "'pve02z11'"

	redis-cli HMSET pve01a11:????

	redis-cli HGETALL pve04d11:114
	 1) "name"
	 2) "prueba"
	 3) "vmid"
	 4) "114"
	 5) "status"
	 6) "stopped"
	 7) "cpus"
	 8) "2"
	 9) "mem"
	10) "0"
	11) "uptime"
	12) "0"

	redis-cli KEYS '*'
	 1) "pve01b11:110"
	 2) "pve02z11:100"
	 3) "pve01b11:108"
	 4) "pve02a11:103"
	 5) "pve03b11:104"
	 6) "pve02a11:119"
	 7) "pve04d11:121"
	 8) "pve01a11:125"
	 9) "pve02a11:104"
	10) "pve02a11:108"


### Backup BD

	La base de datos está localizada en /var/lib/redis/dump.rdb
