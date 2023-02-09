DOCK_FIL = docker-compose.yml
DOCK_DIR = srcs

export NOW := $(shell date '+%F_%H:%M:%S')

all: up

up:
	@cd ${DOCK_DIR}; ./get_env.sh
	sudo mkdir -p $(PWD)/data/mariadb/
	sudo mkdir -p $(PWD)/data/wordpress/
	sudo echo "127.0.0.1 vheran.42.fr"
	docker-compose -f $(PWD)/$(DOCK_DIR)/$(DOCK_FIL) --env-file srcs/.env up -d --build

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
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf ./srcs/data/wordpress/*

git:
	git add .
	git commit -m "Upload by $(LOGNAME) $(NOW)"
	git push

.PHONY: all re down clean
