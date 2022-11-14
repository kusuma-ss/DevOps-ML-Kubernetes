#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=kusumass/app

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login -u kusumass
docker tag app kusumass/flaskapplication
# Step 3:
# Push image to a docker repository
docker push kusumass/flaskapplication
