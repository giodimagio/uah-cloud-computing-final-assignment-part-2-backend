import datetime
from flask import Flask, jsonify
from flask_cors import cross_origin
from flask_restful import Api, Resource

app = Flask(__name__)
api = Api(app)

class Microservice2(Resource):
    @cross_origin()
    def get(self):
        return jsonify(message="Microservice 2 - Version 1", timestamp=str(datetime.datetime.now()))
    
api.add_resource(Microservice2, '/microservice-2')