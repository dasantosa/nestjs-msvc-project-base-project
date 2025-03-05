#!/bin/bash

# Define services
SERVICES=("nestjs-msvc-project-auth-msvc" "nestjs-msvc-project-other-msvc" "nestjs-msvc-project-api-gateway")

# Build and tag Docker images for each service
for SERVICE in "${SERVICES[@]}"; do
    echo "Building Docker image for $SERVICE..."
    (cd $SERVICE && ./generate_docker_image.sh)
    echo "$SERVICE image built successfully."
done

# Deploy using Docker stack
echo "Deploying services with Docker stack..."
docker stack deploy -c docker-compose.yml nestjs-backend

echo "All services have been deployed successfully."