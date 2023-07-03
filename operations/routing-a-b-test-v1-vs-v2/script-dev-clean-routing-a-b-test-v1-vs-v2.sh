#!/bin/bash

#################### Operation: Cleans traffic routing between versions v1 & v2 ####################

# ------------------ Development ------------------ #

kubectl apply -f dev-microservice1-destinationrule.yaml
kubectl apply -f dev-microservice2-destinationrule.yaml
kubectl apply -f dev-microservice1-virtualservice.yaml
kubectl apply -f dev-microservice2-virtualservice.yaml