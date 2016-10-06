# LARP
#### **LARP: Linux, Apache, Redis, PHP.**
[![](https://images.microbadger.com/badges/version/jorgeandrada/larp.svg)](https://microbadger.com/images/jorgeandrada/larp "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/jorgeandrada/larp.svg)](https://microbadger.com/images/jorgeandrada/larp "Get your own image badge on microbadger.com")

### Uso
	docker pull jorgeandrada/larp
	docker run --name=larp -p 8080:80  -h larp -d jorgeandrada/larp
	docker exec -it larp /bin/bash

### Uso con persistencia de datos
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

### Backup BD

	La base de datos está localizada en /var/lib/redis/dump.rdb
