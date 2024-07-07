# -f: --file
# -q: --quiet
# -a: --all
# $$: escape $ for shell

all:
	@mkdir -p $(HOME)/data/wordpress 			
# mkdir -p: if there is no directory, create it
	@mkdir -p $(HOME)/data/mariadb 				
# HOME: home directory yani /Users/username
	@docker-compose -f ./srcs/docker-compose.yml up
# buradaki -f docker-compose dosyasının pathini belirtir ve up: start and attach to containers for a service

down:
	@docker-compose -f ./srcs/docker-compose.yml down 
# down: stop and remove containers, networks, images, and volumes

re:
	@docker-compose -f srcs/docker-compose.yml up --build 
# --build: Build images before starting containers

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf $(HOME)/data/wordpress
	rm -rf $(HOME)/data/mariadb

.PHONY: all re down clean # phony: targets that are not files
