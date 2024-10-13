#!/bin/bash

# Update package list
sudo apt-get update

# Install Docker
sudo apt-get install -y docker.io

# Start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Pull the image from Docker Hub (replace with your desired image)
docker pull nginx

# Run the pulled image with Docker
docker run -d --name my-nginx -p 80:80 nginx
