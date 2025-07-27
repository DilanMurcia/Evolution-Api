#!/bin/bash
echo Levantando contenedores...
docker-compose up -d

echo "⏳ Esperando 50 segundos a que inicie evolution_api..."
sleep 50

echo "▶️ Ejecutando Prisma Generate en el contenedor..."
docker exec evolution_api npx prisma generate --schema=./prisma/mysql-schema.prisma

echo "▶️ Ejecutando Prisma Studio en el contenedor..."
docker exec -it evolution_api npx prisma studio --schema=./prisma/mysql-schema.prisma

echo "✅ Prisma generado y studio ejecutado. Puedes usar la API."
