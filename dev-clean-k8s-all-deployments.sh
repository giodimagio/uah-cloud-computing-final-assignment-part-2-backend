#!/bin/bash

#################### Cleaning script to delete all deployments ####################

# ------------------ Development ------------------ #

kubectl delete gateways --all -n uah-dev
kubectl delete deployments --all -n uah-dev
kubectl delete pods --all -n uah-dev
kubectl delete services --all -n uah-dev
kubectl delete virtualservices --all -n uah-dev
kubectl delete destinationrules --all -n uah-dev
kubectl delete serviceaccounts --all -n uah-dev
