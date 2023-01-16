import datetime
from flask import jsonify
from flask_cors import cross_origin
from flask_restful import Resource

class Microservice3(Resource):
    @cross_origin()
    def get(self):
        return jsonify(message="Microservice 3 - Version 1", timestamp=str(datetime.datetime.now()))