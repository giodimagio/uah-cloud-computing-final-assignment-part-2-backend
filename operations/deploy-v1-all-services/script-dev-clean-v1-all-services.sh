#!/bin/bash

#################### Operation: Clean deployment of all v1 services ####################

# ------------------ Development ------------------ #

kubectl delete -f dev-deploy-istio-gateway.yaml -n uah-dev
kubectl delete -f dev-deploy-k8s-microservice1-v1.yaml -n uah-dev
kubectl delete -f dev-deploy-k8s-microservice2-v1.yaml -n uah-dev
kubectl delete -f dev-deploy-k8s-microservice3-v1.yaml -n uah-dev