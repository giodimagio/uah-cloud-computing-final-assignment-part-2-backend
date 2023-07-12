#!/bin/bash

#################### Operation: Deploy version 2 of all services ####################

# ------------------ Development ------------------ #

kubectl apply -f dev-deploy-k8s-api-gateway-v2.yaml -n uah-dev
kubectl apply -f dev-deploy-k8s-microservice3-v2.yaml -n uah-dev