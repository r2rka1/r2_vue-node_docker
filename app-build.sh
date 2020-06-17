#! /bin/bash

# Define colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

if [ ! -f "./.env" ]; then
    echo "${YELLOW}No .env detected. Using example env...${NC}"
    cp ./.env.example ./.env
fi

. ./.env

if [ "$DOCKER_LOCAL_PATH" = "" ]; then
    echo "${YELLOW}DOCKER_LOCAL_PATH in .env is empty${NC}"
    exit 1
fi

if [ "$ADMIN_LOCAL_PATH" = "" ]; then
    echo "${YELLOW}ADMIN_LOCAL_PATH in .env is empty${NC}"
    exit 1
fi

if [ "$SERVER_LOCAL_PATH" = "" ]; then
    echo "${YELLOW}SERVER_LOCAL_PATH in .env is empty${NC}"
    exit 1
fi

echo "${GREEN}Building containers...${NC}"

docker-compose up --force-recreate --build