@echo off
echo Levantando contenedores...
docker-compose up -d

echo Esperando 50 segundos...
timeout /t 50

echo Ejecutando prisma generate...
docker exec evolution_api npx prisma generate --schema=./prisma/mysql-schema.prisma

echo Ejecutando prisma studio...
docker exec -it evolution_api npx prisma studio --schema=./prisma/mysql-schema.prisma

echo Listo.
pause
