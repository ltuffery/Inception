all: up

up:
	docker compose -f srcs/docker-compose.yml up --build -d

down:
	docker compose -f srcs/docker-compose.yml down

fclean: down
	docker system prune -af --volumes
	rm -rf /home/data/mariadb/* /home/data/wordpress/*

re: fclean up

.PHONY: up down fclean re