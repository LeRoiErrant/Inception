DOCK_FIL = docker-compose.yml
DOCK_DIR = srcs

export NOW := $(shell date '+%F_%H:%M:%S')
export MY_HOST:= "127.0.0.1 vheran.42.fr"

all: up

up:
	@./get_env.sh
	@mv .env srcs/
	@if ! cd /home/vheran/data/mariadb 2>/dev/null; then sudo mkdir -p /home/vheran/data/mariadb/; fi
	@if ! cd /home/vheran/data/wordpress 2>/dev/null; then sudo mkdir -p /home/vheran/data/wordpress/; fi
	@if ! grep -Fxq $(MY_HOST) /etc/hosts; then sudo echo $(MY_HOST) >> /etc/hosts; fi
	docker compose -f $(PWD)/$(DOCK_DIR)/$(DOCK_FIL) --env-file srcs/.env up -d --build

down:
	docker-compose -f $(PWD)/$(DOCK_DIR)/$(DOCK_FIL) down -v

re: down all

nginx:
	@docker exec -it $$(docker ps | grep nginx | awk '{print $$1}') bash

wordpress:
	@docker exec -it $$(docker ps | grep wordpress | awk '{print $$1}') bash

mariadb:
	@docker exec -it $$(docker ps | grep mariadb | awk '{print $$1}') bash

clean:
	docker system prune -f

git:
	git add .
	git commit -m "Upload by $(LOGNAME) $(NOW)"
	git push

.PHONY: all re down clean
