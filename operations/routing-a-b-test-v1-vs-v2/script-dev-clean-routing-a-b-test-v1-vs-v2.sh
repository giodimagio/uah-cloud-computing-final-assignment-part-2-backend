#!/bin/bash

#################### Operation: Cleans traffic routing between versions v1 & v2 ####################

# ------------------ Development ------------------ #

kubectl delete -f dev-microservice1-destinationrule.yaml -n uah-dev
kubectl delete -f dev-microservice2-destinationrule.yaml -n uah-dev
kubectl delete -f dev-microservice3-destinationrule.yaml -n uah-dev
kubectl delete -f dev-microservice1-virtualservice.yaml -n uah-dev
kubectl delete -f dev-microservice2-virtualservice.yaml -n uah-dev
kubectl delete -f dev-microservice3-virtualservice.yaml -n uah-dev