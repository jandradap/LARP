# LARP
LARP: Linux, Apache, Redis, PHP.


### Uso
	docker pull jorgeandrada/larp
	docker run --name=proxmox_info -p 8080:80 -d jorgeandrada/larp
	docker exec -it proxmox_info /bin/bash

### Uso con volumen
	docker pull jorgeandrada/larp
	sudo mkdir /srv/apache
	docker run --name=proxmox_info -p 8080:80 -v /srv/apache:/var/www/html -d jorgeandrada/larp
	docker exec -it proxmox_info /bin/bash

### Realización de pruebas
echo "Ernesto Blanca Xanxes Fran Jorge"| redi -as capacidad
redi -ag capacidad