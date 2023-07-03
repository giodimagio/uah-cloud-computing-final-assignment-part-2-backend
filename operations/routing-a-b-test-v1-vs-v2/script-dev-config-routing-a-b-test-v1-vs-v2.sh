#!/bin/bash

#################### Operation: Routes n % of the traffic to v1 & v2 ####################

# ------------------ Development ------------------ #

kubectl delete -f dev-microservice1-destinationrule.yaml
kubectl delete -f dev-microservice2-destinationrule.yaml
kubectl delete -f dev-microservice1-virtualservice.yaml
kubectl delete -f dev-microservice2-virtualservice.yaml
