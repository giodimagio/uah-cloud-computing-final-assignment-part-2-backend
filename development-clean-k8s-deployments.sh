#!/bin/bash

#################### Cleaning script to delete all deployments ####################

# ------------------ Development ------------------ #

kubectl delete -f development-deploy-k8s-microservice1-v1.yaml -n uah-development

kubectl delete -f development-deploy-istio-gateway.yaml -n uah-development

kubectl delete gateway api-gateway -n uah-development

kubectl delete pods --all -n uah-development

kubectl delete services --all -n uah-development

kubectl delete deployments --all -n uah-development

kubectl delete virtualservices --all -n uah-development

kubectl delete destinationrules --all -n uah-development

kubectl delete serviceaccounts --all -n uah-development

kubectl delete gateways --all -n uah-development

kubectl delete namespace uah-development 