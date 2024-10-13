#!/bin/bash

# Update package list
sudo yum update -y

# Install Git
sudo yum install -y git

# Install Docker
sudo amazon-linux-extras install docker -y

# Start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Pull the Docker image from Docker Hub or ECR
docker pull gcr.io/justjules-docker/beron-app:v3

# Run the pulled image with Docker
docker run -d --name my-container -p 80:8080 gcr.io/justjules-docker/beron-app:v3
