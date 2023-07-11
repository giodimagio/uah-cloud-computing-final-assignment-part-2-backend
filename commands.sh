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

        ### Build images - v1
        docker image build -t giodimagio/api-gateway:v1 .   # Flask API Gateway v1
        docker image build -t giodimagio/frontend-svelte:v1 .   # Frontend Svelte v1
        docker image build -t giodimagio/microservice1:v1 .   # Microservice 1 v1
        docker image build -t giodimagio/microservice2:v1 .   # Microservice 2 v1
        docker image build -t giodimagio/microservice3:v1 .   # Microservice 3 v1

        ### Build images - v2
        docker image build -t giodimagio/microservice1:v2 .   # Microservice 1 v2
        docker image build -t giodimagio/microservice2:v2 .   # Microservice 2 v2
        docker image build -t giodimagio/microservice3:v2 .   # Microservice 3 v2

        ### Push images to Docker Hub - v1
        docker image push giodimagio/api-gateway:v1   # Flask API Gateway v1
        docker image push giodimagio/frontend-svelte:v1   # Frontend Svelte v1
        docker image push giodimagio/microservice1:v1   # Microservice 1 v1
        docker image push giodimagio/microservice2:v1   # Microservice 2 v1
        docker image push giodimagio/microservice3:v1   # Microservice 3 v1

        ### Push images to Docker Hub - v2
        docker image push giodimagio/microservice1:v2   # Microservice 1 v2
        docker image push giodimagio/microservice2:v2   # Microservice 2 v2
        docker image push giodimagio/microservice3:v2   # Microservice 3 v2

        ### Remove images - v1
        docker image rm giodimagio/api-gateway:v1   # Flask API Gateway v1
        docker image rm giodimagio/frontend-svelte:v1   # Frontend Svelte v1
        docker image rm giodimagio/microservice1:v1   # Microservice 1 v1 
        docker image rm giodimagio/microservice2:v1   # Microservice 2 v1
        docker image rm giodimagio/microservice3:v1   # Microservice 3 v1

        ### Remove images - v2
        docker image rm giodimagio/microservice1:v2   # Microservice 1 v2
        docker image rm giodimagio/microservice2:v2   # Microservice 2 v2
        docker image rm giodimagio/microservice3:v2   # Microservice 3 v2

        ### Run containers - v1
        docker container run -d -p 9000:9000 --name api-gateway giodimagio/api-gateway:v1   # Flask API Gateway v1
        docker container run -d -p 4000:4000 --name frontend-svelte giodimagio/frontend-svelte:v1   # Frontend Svelte v1
        docker container run -d -p 5010:5001 --env-file .env.local_docker --name microservice1 giodimagio/microservice1:v1   # Microservice 1 v1
        docker container run -d -p 5020:5002 --env-file .env.local_docker --name microservice2 giodimagio/microservice2:v1   # Microservice 2 v1
        docker container run -d -p 5030:5003 --env-file .env.local_docker --name microservice3 giodimagio/microservice3:v1   # Microservice 3 v1

        ### Run containers - v2
        docker container run -d -p 5010:5001 --env-file .env.local_docker --name microservice1 giodimagio/microservice1:v2   # Microservice 1 v2
        docker container run -d -p 5020:5002 --env-file .env.local_docker --name microservice2 giodimagio/microservice2:v2   # Microservice 2 v2
        docker container run -d -p 5030:5003 --env-file .env.local_docker --name microservice3 giodimagio/microservice3:v2   # Microservice 3 v2

        ### Stop containers - v1
        docker container stop api-gateway:v1   # Flask API Gateway v1
        docker container stop frontend-svelte:v1   # Frontend Svelte v1
        docker container stop microservice1:v1   # Microservice 1 v1
        docker container stop microservice2:v1   # Microservice 2 v1
        docker container stop microservice3:v1   # Microservice 3 v1
        
        ### Stop containers - v2
        docker container stop microservice1:v2   # Microservice 1 v2
        docker container stop microservice2:v2   # Microservice 2 v2
        docker container stop microservice3:v2   # Microservice 3 v2

        ### Remove containers - v1
        docker container rm api-gateway:v1   # Flask API Gateway v1
        docker container rm frontend-svelte:v1   # Frontend Svelte v1
        docker container rm microservice1:v1   # Microservice 1 v1
        docker container rm microservice2:v1   # Microservice 2 v1
        docker container rm microservice3:v1   # Microservice 3 v1
        
        ### Remove containers - v2
        docker container rm microservice1:v2   # Microservice 1 v2
        docker container rm microservice2:v2   # Microservice 2 v2
        docker container rm microservice3:v2   # Microservice 3 v2

        ### Execute commands in containers - v1
        docker container exec -it api-gateway:v1 /bin/bash   # Flask API Gateway v1
        docker container exec -it frontend-svelte:v1 /bin/bash   # Frontend Svelte v1
        docker container exec -it microservice1:v1 /bin/bash   # Microservice 1 v1
        docker container exec -it microservice2:v1 /bin/bash   # Microservice 2 v1
        docker container exec -it microservice3:v1 /bin/bash   # Microservice 3 v1

        ### Execute commands in containers - v2
        docker container exec -it microservice1:v2 /bin/bash   # Microservice 1 v2
        docker container exec -it microservice2:v2 /bin/bash   # Microservice 2 v2
        docker container exec -it microservice3:v2 /bin/bash   # Microservice 3 v2

    ## (Locally with Docker Compose) Run all microservices:

        ### Run containers
        docker-compose up -d

        ### Stop containers
        docker-compose down

        ### Execute commands in containers - v1
        docker-compose exec api-gateway:v1 /bin/bash   # Flask API Gateway v1
        docker-compose exec frontend-svelte:v1 /bin/bash   # Frontend Svelte v1
        docker-compose exec microservice1:v1 /bin/bash   # Microservice 1 v1
        docker-compose exec microservice2:v1 /bin/bash   # Microservice 2 v1
        docker-compose exec microservice3:v1 /bin/bash   # Microservice 3 v1

        ### Execute commands in containers - v2
        docker-compose exec microservice1:v2 /bin/bash   # Microservice 1 v2
        docker-compose exec microservice2:v2 /bin/bash   # Microservice 2 v2
        docker-compose exec microservice3:v2 /bin/bash   # Microservice 3 v2

    ## (Locally with Kubernetes managed with Istio) Run the application

        ### K8s reset kubernetes cluster
        #### Use Docker Desktop to reset Kubernetes cluster: Settings -> Kubernetes -> Reset Kubernetes cluster

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
        kubectl get serviceaccounts -n uah-dev --show-labels 

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

        ### K8s describes service <service-name>
        kubectl describe service microservice1 -n uah-dev

        ### K8s get logs of a pod <pod-name>
        kubectl logs microservice1-75dfb94b85-gxwdn -n uah-dev

        ### K8s deploy istio gateway
        kubectl apply -f dev-deploy-istio-gateway.yaml -n uah-dev

        ### K8s deploy the application - v1
        kubectl apply -f dev-deploy-k8s-api-gateway-v1.yaml -n uah-dev   # Flask API Gateway v1
        kubectl apply -f dev-deploy-k8s-frontend-svelte-v1.yaml -n uah-dev   # Frontend Svelte v1
        kubectl apply -f dev-deploy-k8s-microservice1-v1.yaml -n uah-dev   # Microservice 1 v1
        kubectl apply -f dev-deploy-k8s-microservice2-v1.yaml -n uah-dev   # Microservice 2 v1
        kubectl apply -f dev-deploy-k8s-microservice3-v1.yaml -n uah-dev   # Microservice 3 v1

        ### K8s deploy the application - v2
        kubectl apply -f dev-deploy-k8s-microservice1-v2.yaml -n uah-dev   # Microservice 1 v2
        kubectl apply -f dev-deploy-k8s-microservice2-v2.yaml -n uah-dev   # Microservice 2 v2
        kubectl apply -f dev-deploy-k8s-microservice3-v2.yaml -n uah-dev   # Microservice 3 v2

        ### K8s delete istio gateway & virtualservice by their yaml file
        kubectl delete -f dev-deploy-istio-gateway.yaml -n uah-dev

        ### K8s delete the deployment & service by their yaml file - v1
        kubectl delete -f dev-deploy-k8s-api-gateway-v1.yaml -n uah-dev   # Flask API Gateway v1
        kubectl delete -f dev-deploy-k8s-frontend-svelte-v1.yaml -n uah-dev   # Frontend Svelte v1
        kubectl delete -f dev-deploy-k8s-microservice1-v1.yaml -n uah-dev   # Microservice 1 v1
        kubectl delete -f dev-deploy-k8s-microservice2-v1.yaml -n uah-dev   # Microservice 2 v1
        kubectl delete -f dev-deploy-k8s-microservice3-v1.yaml -n uah-dev   # Microservice 3 v1

        ### K8s delete the deployment & service by their yaml file - v2
        kubectl delete -f dev-deploy-k8s-microservice1-v2.yaml -n uah-dev   # Microservice 1 v2
        kubectl delete -f dev-deploy-k8s-microservice2-v2.yaml -n uah-dev   # Microservice 2 v2

        ### K8s shell into a pod <pod-name>
        kubectl exec -it microservice1-75dfb94b85-gxwdn -n uah-dev /bin/bash

        ### K8s execcute cURL command into a deployed pod <pod-name>
        kubectl exec -it microservice1-75dfb94b85-gxwdn -n uah-dev -- curl http://microservice1.uah-dev.svc.cluster.local:5000/microservice-1

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

            #### K8s Addons deployment (from ~/istio-1.18.0 directory)
            kubectl apply -f samples/addons

            #### K8s Addons uninstall (from ~/istio-1.18.0 directory)
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
    curl -I http://localhost:5001/microservice1   # Microservice 1
    curl -I http://localhost:5002/microservice2   # Microservice 2
    curl -I http://localhost:5003/microservice3   # Microservice 3

    ## (Locally on Docker) Check if URLs are available
    curl -I http://localhost:5010/microservice1   # Microservice 1
    curl -I http://localhost:5020/microservice2   # Microservice 2
    curl -I http://localhost:5030/microservice3   # Microservice 3

    ## (Locally on Kubernetes inside the docker container or istio envoy proxy) Check if URLs are available
    curl -I http://api-gateway:9000/api   # Flask API Gateway
    curl -I http://frontend-svelte:4000/front   # Frontend Svelte
    curl -I http://microservice1:5001/microservic1   # Microservice 1
    curl -I http://microservice1:5001/microservice2   # Microservice 2
    curl -I http://microservice1:5001/microservice3   # Microservice 3
    
    ## (Locally on Kubernetes agains API Gateway or Frontend service) Check if URLs are available
    curl -I http://localhost:80/api   # Flask API Gateway
    curl -I http://localhost:80/front   # Frontend Svelte
    curl -I http://localhost:80/api/v1/microservice1   # Microservice 1
    curl -I http://localhost:80/api/v1/microservice2   # Microservice 2
    curl -I http://localhost:80/api/v1/microservice3   # Microservice 3

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