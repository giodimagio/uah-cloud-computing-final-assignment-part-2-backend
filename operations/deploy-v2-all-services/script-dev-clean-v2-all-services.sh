#!/bin/bash

#################### Operation: Clean deployment of 2 all services ####################

# ------------------ Development ------------------ #

kubectl delete -f dev-deploy-k8s-api-gateway-v2.yaml -n uah-dev
kubectl delete -f dev-deploy-k8s-microservice3-v2.yaml -n uah-dev