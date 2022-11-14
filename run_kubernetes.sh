#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="kusumass/flaskapplication:latest"

# Step 2
# Run the Docker Hub container with kubernetes
#kubectl create deploy flaskapp --image="kusumass/flaskapp:latest"

kubectl run "flasklearnapplication"  \
    --image="$dockerpath"\
    --port=80 --labels app="flasklearnapplication"


# Step 3:
# List kubernetes pods
#kubectl get nodes
kubectl get pods

# Step 4:
# Forward the container port to a host

kubectl port-forward flasklearnapplication 8000:80