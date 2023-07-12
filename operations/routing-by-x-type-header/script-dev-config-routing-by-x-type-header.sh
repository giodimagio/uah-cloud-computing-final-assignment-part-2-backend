#!/bin/bash

#################### Operation: Routes n % of the traffic to v1 & v2 ####################

# ------------------ Development ------------------ #

kubectl apply -f dev-api-gateway-virtualservice.yaml -n uah-dev
kubectl apply -f dev-microservice1-virtualservice.yaml -n uah-dev
kubectl apply -f dev-microservice2-virtualservice.yaml -n uah-dev
kubectl apply -f dev-api-gateway-destinationrule.yaml -n uah-dev
kubectl apply -f dev-microservice1-destinationrule.yaml -n uah-dev
kubectl apply -f dev-microservice2-destinationrule.yaml -n uah-dev