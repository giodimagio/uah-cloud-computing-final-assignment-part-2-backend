#!/bin/bash

#################### Deployment script to deploy all the backend microservices ####################

# ------------------ Development ------------------ #

kubectl apply -f dev-deploy-istio-gateway.yaml -n uah-dev
kubectl apply -f dev-deploy-k8s-microservice1-v1.yaml -n uah-dev
kubectl apply -f dev-deploy-k8s-microservice2-v1.yaml -n uah-dev