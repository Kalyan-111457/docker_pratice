# Docker Compose Makefile

.PHONY: help build up down restart logs clean ps

help:
	@echo "Docker Compose Commands:"
	@echo "  make build       - Build Docker images"
	@echo "  make up          - Start containers"
	@echo "  make down        - Stop containers"
	@echo "  make restart     - Restart containers"
	@echo "  make logs        - View container logs"
	@echo "  make ps          - List running containers"
	@echo "  make clean       - Remove containers and volumes"

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

restart:
	docker-compose restart

logs:
	docker-compose logs -f

logs-backend:
	docker-compose logs -f backend

logs-frontend:
	docker-compose logs -f frontend

ps:
	docker-compose ps

clean:
	docker-compose down -v

pull:
	docker-compose pull

prune:
	docker system prune -f

rebuild: clean build up

shell-backend:
	docker-compose exec backend sh

shell-frontend:
	docker-compose exec frontend sh

version:
	docker-compose version

validate:
	docker-compose config
