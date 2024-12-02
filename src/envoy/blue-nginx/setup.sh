#!/bin/bash

# Define image name and version
IMAGE_NAME="dhinojosa/blue-nginx"
VERSION="1.0.3"

# Docker Hub API URL for image tag check
DOCKER_HUB_API_URL="https://hub.docker.com/v2/repositories/${IMAGE_NAME}/tags/${VERSION}"

# Function to check if the image exists locally
function check_local_image() {
    docker image inspect ${IMAGE_NAME}:${VERSION} > /dev/null 2>&1
}

# Function to check if the image exists on Docker Hub
function check_dockerhub_image() {
    curl --silent --fail ${DOCKER_HUB_API_URL} > /dev/null
}

# Check if the image exists locally
if check_local_image; then
    echo "Image ${IMAGE_NAME}:${VERSION} already exists locally. Skipping build."

# If the image doesn't exist locally, check if it exists on Docker Hub
elif check_dockerhub_image; then
    echo "Image ${IMAGE_NAME}:${VERSION} already exists on Docker Hub. Skipping build and push."

# If the image doesn't exist locally or on Docker Hub, build and push it
else
    echo "Image ${IMAGE_NAME}:${VERSION} not found locally or on Docker Hub. Proceeding with build and push."

    # Build the blue NGINX image using Docker Buildx and push it to Docker Hub
    docker buildx build --platform linux/amd64,linux/arm64 \
        -t ${IMAGE_NAME}:${VERSION} \
        -f Dockerfile . --push

    echo "Successfully built and pushed ${IMAGE_NAME}:${VERSION}"
fi
