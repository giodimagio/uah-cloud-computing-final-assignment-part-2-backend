#!/bin/bash

#################### Cleaning script to delete backend deployments ####################

# ------------------ Development ------------------ #

kubectl delete -f dev-deploy-istio-gateway.yaml -n uah-dev
kubectl delete -f dev-deploy-k8s-microservice1-v1.yaml -n uah-dev
kubectl delete -f dev-deploy-k8s-microservice2-v1.yaml -n uah-dev