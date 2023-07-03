#!/bin/bash

#################### Operation: Clean deployment of 2 v2 services ####################

# ------------------ Development ------------------ #

kubectl delete -f dev-deploy-k8s-microservice1-v2.yaml -n uah-dev
kubectl delete -f dev-deploy-k8s-microservice2-v2.yaml -n uah-dev