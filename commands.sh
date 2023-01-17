#!/bin/bash

#################### Commands used for the project ####################

# ------------------ Development ------------------ #

    ## (Locally on WSL 2) Run each microservice:

        ### Inside pipenv shell
        flask --app ./microservice1/microservice_1.py --debug run --port=5001
        flask --app ./microservice2/microservice_2.py --debug run --port=5002
        flask --app ./microservice3/microservice_3.py --debug run --port=5003

        ### Outside pipenv shell
        python -m flask --app ./microservice1/microservice_1.py --debug run --port=5001
        python -m flask --app ./microservice2/microservice_2.py --debug run --port=5002
        python -m flask --app ./microservice3/microservice_3.py --debug run --port=5003

    ## (Locally on Docker) Run each microservice:

        ### Build images
        docker image build -t giodimagio/microservice1:v1.0 ./microservice1/
        docker image build -t giodimagio/microservice2:v1.0 ./microservice2/
        docker image build -t giodimagio/microservice3:v1.0 ./microservice3/

        ### Remove images
        docker build -t giodimagio/microservice1:v1.0 ./microservice1/
        docker build -t giodimagio/microservice2:v1.0 ./microservice2/
        docker build -t giodimagio/microservice3:v1.0 ./microservice3/

        ### Run containers
        docker container run -d -p 5010:5000 --name microservice1 giodimagio/microservice1:v1.0
        docker container run -d -p 5020:5000 --name microservice2 giodimagio/microservice2:v1.0
        docker container run -d -p 5030:5000 --name microservice3 giodimagio/microservice3:v1.0

        ### Execute commands in containers
        docker container exec -it microservice1 /bin/bash
        docker container exec -it microservice2 /bin/bash
        docker container exec -it microservice3 /bin/bash

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