#!/bin/bash

#################### Commands used for the project ####################

# ------------------ Development ------------------ #

    ## (Locally with WSL 2) Run each microservice:

        ### Inside pipenv shell
        flask --app app.py --env-file=.env.local_wsl2 --debug run --host=localhost --port=5001   # Microservice 1
        flask --app app.py --env-file=.env.local_wsl2 --debug run --host=localhost --port=5002   # Microservice 2
        flask --app app.py --env-file=.env.local_wsl2 --debug run --host=localhost --port=5003   # Microservice 3

        ### Outside pipenv shell
        python3 -Bm flask --app app.py --debug run --host=localhost --port=5001   # Microservice 1
        python3 -Bm flask --app app.py --debug run --host=localhost --port=5002   # Microservice 2
        python3 -Bm flask --app app.py --debug run --host=localhost --port=5003   # Microservice 3

    ## (Locally with Docker) Run each microservice separately:

        ### Build images
        docker image build -t giodimagio/microservice1:v1 .   # Microservice 1
        docker image build -t giodimagio/microservice2:v1 .   # Microservice 2
        docker image build -t giodimagio/microservice3:v1 .   # Microservice 3

        ### Push images to Docker Hub
        docker image push giodimagio/microservice1:v1   # Microservice 1
        docker image push giodimagio/microservice2:v1   # Microservice 2
        docker image push giodimagio/microservice3:v1   # Microservice 3

        ### Remove images
        docker image rm giodimagio/microservice1:v1   # Microservice 1
        docker image rm giodimagio/microservice2:v1   # Microservice 2
        docker image rm giodimagio/microservice3:v1   # Microservice 3

        ### Run containers
        docker container run -d -p 5010:5001 --env-file .env.local_docker --name microservice1 giodimagio/microservice1:v1   # Microservice 1 
        docker container run -d -p 5020:5002 --env-file .env.local_docker --name microservice2 giodimagio/microservice2:v1   # Microservice 2 
        docker container run -d -p 5030:5003 --env-file .env.local_docker --name microservice3 giodimagio/microservice3:v1   # Microservice 3 

        ### Stop containers
        docker container stop microservice1   # Microservice 1
        docker container stop microservice2   # Microservice 2
        docker container stop microservice3   # Microservice 3

        ### Remove containers
        docker container rm microservice1   # Microservice 1
        docker container rm microservice2   # Microservice 2
        docker container rm microservice3   # Microservice 3

        ### Execute commands in containers
        docker container exec -it microservice1 /bin/bash   # Microservice 1
        docker container exec -it microservice2 /bin/bash   # Microservice 2
        docker container exec -it microservice3 /bin/bash   # Microservice 3

    ## (Locally with Docker Compose) Run all microservices:

        ### Run containers
        docker-compose up -d

        ### Stop containers
        docker-compose down

        ### Execute commands in containers
        docker-compose exec microservice1 /bin/bash   # Microservice 1
        docker-compose exec microservice2 /bin/bash   # Microservice 2
        docker-compose exec microservice3 /bin/bash   # Microservice 3

    ## (Locally with Kubernetes managed with Istio) Run the application

        ### K8s create namespace
        kubectl create namespace uah-dev

        ### K8s delete namespace
        kubectl delete namespace uah-dev

        ### K8s create deployment
        # kubectl create -f deployment.yaml -n uah-dev

        ### K8s label "uah-dev" namespace for Istio injection
        kubectl label namespace uah-dev istio-injection=enabled

        ### K8s get cluster info
        kubectl cluster-info

        ### K8s get all namespaces & their labels
        kubectl get namespaces --show-labels

        ### K8s get all pods of "uah-dev" namespace with labels
        kubectl get pods -n uah-dev --show-labels

        ### K8s get all services of "uah-dev" namespace with labels
        kubectl get services -n uah-dev --show-labels

        ### K8s get all deployments of "uah-dev" namespace with labels
        kubectl get deployments -n uah-dev --show-labels

        ### K8s get all virtualservices of "uah-dev" namespace with labels
        kubectl get virtualservices -n uah-dev --show-labels

        ### K8s get all destinationrules of "uah-dev" namespace with labels
        kubectl get destinationrules -n uah-dev --show-labels

        ### K8s get all serviceaccounts of "uah-dev" namespace with labels
        kubectl get serviceaccounts -n uah-dev  

        ### K8s get all gateways of "uah-dev" namespace with labels
        kubectl get gateways -n uah-dev --show-labels

        ### K8s get pod <pod-name>
        kubectl get pod microservice1-75dfb94b85-gxwdn -n uah-dev

        ### K8s get service <service-name>
        kubectl get service microservice1 -n uah-dev
        kubectl get service istio-ingressgateway -n istio-system

        ### K8s get gateway <gateway-name>
        kubectl get gateway -n uah-dev

        ### K8s get virtualservice <virtualservice-name>
        kubectl get virtualservice -n uah-dev

        ### K8s get destinationrule <destinationrule-name>
        kubectl get destinationrule -n uah-dev

        ### K8s describe pod <pod-name>
        kubectl describe pod microservice1-75dfb94b85-gxwdn -n uah-dev

        ### K8s describes service
        kubectl describe service microservice1-service -n uah-dev

        ### K8s get logs of a pod <pod-name>
        kubectl logs microservice1-75dfb94b85-gxwdn -n uah-dev

        ### K8s deploy istio gateway
        kubectl apply -f dev-deploy-istio-gateway.yaml -n uah-dev

        ### K8s deploy the application
        kubectl apply -f dev-deploy-k8s-microservice1-v1.yaml -n uah-dev   # Microservice 1
        kubectl apply -f dev-deploy-k8s-microservice2-v1.yaml -n uah-dev   # Microservice 2

        ### K8s delete istio gateway & virtualservice by their yaml file
        kubectl delete -f dev-deploy-istio-gateway.yaml -n uah-dev

        ### K8s delete the deployment & service by their yaml file
        kubectl delete -f dev-deploy-k8s-microservice1-v1.yaml -n uah-dev   # Microservice 1
        kubectl delete -f dev-deploy-k8s-microservice2-v1.yaml -n uah-dev   # Microservice 2

        ### K8s shell into a pod <pod-name>
        kubectl exec -it microservice1-75dfb94b85-gxwdn -n uah-dev /bin/bash

        ### K8s execcute cURL command into a deployed pod <pod-name>
        kubectl exec -it microservice1-75dfb94b85-gxwdn -n uah-dev -- curl http://microservice1-service.uah-dev.svc.cluster.local:5000/microservice-1

        ### K8s delete istio gateway by its <gateway-name>
        kubectl delete gateway ingress-gateway -n uah-dev

        ### K8s delete all pods of "uah-dev" namespace
        kubectl delete pods --all -n uah-dev

        ### K8s delete all services of "uah-dev" namespace
        kubectl delete services --all -n uah-dev

        ### K8s delete all deployments of "uah-dev" namespace
        kubectl delete deployments --all -n uah-dev

        ### K8s delete all virtualservices of "uah-dev" namespace
        kubectl delete virtualservices --all -n uah-dev

        ### K8s delete all destinationrules of "uah-dev" namespace
        kubectl delete destinationrules --all -n uah-dev

        ### K8s delete all serviceaccounts of "uah-dev" namespace
        kubectl delete serviceaccounts --all -n uah-dev

        ### K8s delete all gateways of "uah-dev" namespace
        kubectl delete gateways --all -n uah-dev

        ### K8s Addons: https://istio.io/latest/docs/setup/getting-started/#dashboard

            #### K8s Addons deployment
            kubectl apply -f samples/addons

            #### K8s Addons uninstall
            kubectl delete -f samples/addons

            #### K8s check deployment status of kiali deployment
            kubectl rollout status deployment kiali -n istio-system

            #### K8s get kiali service
            kubectl get svc kiali -n istio-system 

            #### Istio Kiali dashboard
            istioctl dashboard kiali

        ### K8s install Gateway API CRDs: https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-control/
        kubectl get crd gateways.gateway.networking.k8s.io || \
        { kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v0.5.1" | kubectl apply -f -; }

        ### Istio install with demo profile (Using Ingress Gateway)
        istioctl install --set profile=demo -y

        ### Istio install with minimal profile (Using Kubernetes Gateway)
        istioctl install --set profile=minimal -y

        ### Istio uninstall

            #### Istio - uninstall
            istioctl uninstall -y --purge

            #### Istio - delete namespace
            kubectl delete namespace istio-system

            #### Istio - unlabel namespace
            kubectl label namespace default istio-injection-

        ### Istio - version
        istioctl version

        ### Istio - get all services
        istioctl proxy-status

        ### Istio - analyze
        istioctl analyze -n uah-dev

# ------------------ Production ------------------ #

# ------------------ Testing ------------------ #

    ## (Locally on WSL 2) Check if URLs are available
    curl -I http://localhost:5001/microservice-1   # Microservice 1
    curl -I http://localhost:5002/microservice-2   # Microservice 2
    curl -I http://localhost:5003/microservice-3   # Microservice 3

    ## (Locally on Docker) Check if URLs are available
    curl -I http://localhost:5010/microservice-1   # Microservice 1
    curl -I http://localhost:5020/microservice-2   # Microservice 2
    curl -I http://localhost:5030/microservice-3   # Microservice 3

    ## (Locally on Kubernetes inside the docker container or istio envoy proxy) Check if URLs are available
    curl -I http://localhost:5000/microservice-1   # Microservice 1
    curl -I http://localhost:5000/microservice-2   # Microservice 2
    curl -I http://localhost:5000/microservice-3   # Microservice 3

    ## (Locally on Kubernetes using the browser agains Kubernetes Gateway) Check if URLs are available
    curl -I http://localhost:80/microservice-1   # Microservice 1
    curl -I http://localhost:80/microservice-2   # Microservice 2
    curl -I http://localhost:80/microservice-3   # Microservice 3

# ------------------ Others ------------------ #

    ## Pipenv - Workflow: https://pipenv-es.readthedocs.io/es/latest/basics.html#example-pipenv-workflow
    pipenv install
    pipenv shell
    python --version

    ## Pipenv - install <package>
    pipenv install flask
    pipenv install flask-cors
    pipenv install flask-restful
    pipenv install requests
    pipenv install python-dotenv

    ## Git - push
    git push origin main

    ## SSH - Authentication with GitHub
    eval $(ssh-agent) && ssh-add ~/.ssh/id_rsa_github_giodimagio_wsl2