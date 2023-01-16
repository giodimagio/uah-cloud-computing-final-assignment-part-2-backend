from flask import Flask
from flask_restful import Api

from microservice1 import Microservice1
from microservice2 import Microservice2
from microservice3 import Microservice3

app = Flask(__name__)
api = Api(app)

api.add_resource(Microservice1, '/microservice-1')
api.add_resource(Microservice2, '/microservice-2')
api.add_resource(Microservice3, '/microservice-3')