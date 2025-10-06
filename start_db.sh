#!/bin/bash
source ./config.env

echo "--- Variables loaded using 'source' ---"
echo "Host: $DATABASE_HOST"
echo "Port: $DATABASE_PORT"
echo "User: $NEO4J_USER"
echo "OS: $OS_TYPE"

IMAGE_TAR_FILE="codeconcise-db-${OS}.tar"
IMAGE_NAME="codeconcise-db"
DEFAULT_PASSWORD=$NEO4J_PASSWORD
CONTAINER_NAME="codeconcise-neo4j"

echo "📦 Loading Neo4j image from $IMAGE_TAR_FILE..."
docker load --input $IMAGE_TAR_FILE

echo "🧹 Cleaning up old container..."
docker stop $CONTAINER_NAME 2> /dev/null
docker rm $CONTAINER_NAME 2> /dev/null


echo "🚀 Starting Neo4j container..."
docker run -d \
    --name $CONTAINER_NAME \
    -p 7474:7474 -p 7687:7687 \
    -e NEO4J_AUTH=neo4j/$DEFAULT_PASSWORD \
    -e NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
    --net=host \
    $CONFIG_VOLUME \
    $IMAGE_NAME

if [ $? -eq 0 ]; then
    echo "✅ Neo4j has started successfully (Container ID: $(docker ps -aqf "name=$CONTAINER_NAME"))."
    echo "   Connect at: http://localhost:7474"
    echo "   User: neo4j | Password: $DEFAULT_PASSWORD"
else
    echo "❌ Failed to start Neo4j container."
fi