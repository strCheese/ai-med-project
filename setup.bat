@echo off
set COMPOSE_PROJECT_NAME=ai-med
docker-compose up -d
echo Waiting for container to start...
timeout /t 5 /nobreak > NUL
docker exec -it debian_ai_container /bin/bash