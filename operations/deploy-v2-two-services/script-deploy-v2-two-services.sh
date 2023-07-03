#!/bin/bash

#################### Operation: Deploy version 2 of 2 services ####################

# ------------------ Development ------------------ #

kubectl apply -f dev-deploy-istio-gateway.yaml -n uah-dev
kubectl apply -f dev-deploy-k8s-microservice1-v2.yaml -n uah-dev
kubectl apply -f dev-deploy-k8s-microservice2-v2.yaml -n uah-dev