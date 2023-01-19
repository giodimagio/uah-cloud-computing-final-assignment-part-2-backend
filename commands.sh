#!/bin/bash

#################### Commands used for the project ####################

# ------------------ Development ------------------ #

    ## (Locally on WSL 2) Run each microservice:

        ### Inside pipenv shell
        flask --app microservice_1.py --debug run --host=localhost --port=5001
        flask --app microservice_2.py --debug run --host=localhost --port=5002
        flask --app microservice_3.py --debug run --host=localhost --port=5003

        ### Outside pipenv shell
        python -Bm flask --app microservice_1.py --debug run --host=localhost --port=5001
        python -Bm flask --app microservice_2.py --debug run --host=localhost --port=5002
        python -Bm flask --app microservice_3.py --debug run --host=localhost --port=5003

    ## (Locally on Docker) Run each microservice:

        ### Build images
        docker image build -t giodimagio/microservice1:v1.0 .
        docker image build -t giodimagio/microservice2:v1.0 .
        docker image build -t giodimagio/microservice3:v1.0 .

        ### Remove images
        docker image rm -t microservice1:v1.0
        docker image rm -t microservice2:v1.0
        docker image rm -t microservice3:v1.0

        ### Run containers
        docker container run -d -p 5010:5000 --name microservice1 giodimagio/microservice1:v1.0
        docker container run -d -p 5020:5000 --name microservice2 giodimagio/microservice2:v1.0
        docker container run -d -p 5030:5000 --name microservice3 giodimagio/microservice3:v1.0

        ### Execute commands in containers
        docker container exec -it microservice1 /bin/bash
        docker container exec -it microservice2 /bin/bash
        docker container exec -it microservice3 /bin/bash

    ## (Locally on Kubernetes managed with Istio) Run the application

        ### K8s create namespace
        kubectl create namespace uah-development

        ### K8s delete namespace
        kubectl delete namespace uah-development 

        ### K8s create deployment
        # kubectl create -f deployment.yaml --namespace=uah-development

        ### K8s label "uah-development" namespace for Istio injection
        kubectl label namespace uah-development istio-injection=enabled

        ### K8s get all namespaces & their labels
        kubectl get namespaces --show-labels

        ### K8s get all pods of "uah-development" namespace with labels
        kubectl get pods --namespace=uah-development --show-labels

        ### K8s get all services of "uah-development" namespace with labels
        kubectl get services --namespace=uah-development --show-labels

        ### K8s get all deployments of "uah-development" namespace with labels
        kubectl get deployments --namespace=uah-development --show-labels

        ## K8s get all virtualservices of "uah-development" namespace with labels
        kubectl get virtualservices --namespace=uah-development --show-labels

        ## K8s get all destinationrules of "uah-development" namespace with labels
        kubectl get destinationrules --namespace=uah-development --show-labels

        ### K8s get all gateways of "uah-development" namespace with labels
        kubectl get gateways --namespace=uah-development --show-labels

        ### K8s get pod <pod-name>
        kubectl get pod microservice1-deployment-7b67d649c5-ltp7w --namespace=uah-development

        ### K8s get service <service-name>
        kubectl get service microservice1 --namespace=uah-development
        kubectl get service istio-ingressgateway --namespace=istio-system

        ### K8s get gateway <gateway-name>
        kubectl get gateway --namespace=uah-development

        ### K8s get virtualservice <virtualservice-name>
        kubectl get virtualservice --namespace=uah-development

        ### K8s get destinationrule <destinationrule-name>
        kubectl get destinationrule --namespace=uah-development

        ### K8s describe pod <pod-name>
        kubectl describe pod microservice1-deployment-7b67d649c5-ltp7w --namespace=uah-development

        ### K8s describes service
        kubectl describe service microservice1-service --namespace=uah-development

        ### K8s get logs of a pod <pod-name>
        kubectl logs microservice1-deployment-7b67d649c5-ltp7w --namespace=uah-development

        ### K8s deploy the application
        kubectl apply -f microservice_1.yaml --namespace=uah-development

        ### K8s deploy istio gateway
        kubectl apply -f microservice_1-gateway.yaml --namespace=uah-development

        ### K8s shell into a pod <pod-name>
        kubectl exec -it microservice1-deployment-7b67d649c5-ltp7w --namespace=uah-development /bin/bash

        ### K8s execcute cURL command into a deployed pod <pod-name>
        kubectl exec -it microservice1-deployment-7b67d649c5-ltp7w --namespace=uah-development -- curl http://microservice1-service.uah-development.svc.cluster.local:5000/microservice-1

        ### K8s delete the application
        kubectl delete -f microservice_1.yaml --namespace=uah-development

        ### K8s delete istio gateway & virtualservice by their yaml file
        kubectl delete -f microservice_1-gateway.yaml --namespace=uah-development

        ### K8s delete istio gateway by its <gateway-name>
        kubectl delete gateway ingress-gateway --namespace=uah-development

        ### K8s delete all pods of "uah-development" namespace
        kubectl delete pods --all --namespace=uah-development

        ### K8s delete all services of "uah-development" namespace
        kubectl delete services --all --namespace=uah-development

        ### K8s delete all deployments of "uah-development" namespace
        kubectl delete deployments --all --namespace=uah-development

        ### K8s delete all virtualservices of "uah-development" namespace
        kubectl delete virtualservices --all --namespace=uah-development

        ### K8s delete all destinationrules of "uah-development" namespace
        kubectl delete destinationrules --all --namespace=uah-development

        ### K8s delete all gateways of "uah-development" namespace
        kubectl delete gateways --all --namespace=uah-development

        ### K8s check deployment status of kiali deployment
        kubectl rollout status deployment kiali --namespace=istio-system

        ### Istio - get all services
        istioctl proxy-status

        ### Istio - analyze
        istioctl analyze --namespace=uah-development

# ------------------ Production ------------------ #

# ------------------ Testing ------------------ #

    ## (Locally on WSL 2) Check if URLs are available
    curl -I http://localhost:5001/microservice-1
    curl -I http://localhost:5002/microservice-2
    curl -I http://localhost:5003/microservice-3

    ## (Locally on Docker) Check if URLs are available
    curl -I http://localhost:5010/microservice-1
    curl -I http://localhost:5020/microservice-2
    curl -I http://localhost:5030/microservice-3

# ------------------ Others ------------------ #

    ## Pipenv - Workflow: https://pipenv-es.readthedocs.io/es/latest/basics.html#example-pipenv-workflow
    pipenv install
    pipenv shell
    python --version

    ## Pipenv - install <package>
    pipenv install flask
    pipenv install flask-cors
    pipenv install flask-restful

    ## Git - push
    git push origin main

    ## SSH - Authentication with GitHub
    eval $(ssh-agent) && ssh-add ~/.ssh/id_rsa_github_giodimagio_wsl2