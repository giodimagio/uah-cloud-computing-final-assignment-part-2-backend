import datetime
import requests
from flask import Flask, jsonify
from flask_cors import cross_origin
from flask_restful import Api, Resource

app = Flask(__name__)
api = Api(app)

class Microservice2(Resource):
    @cross_origin()
    def get(self):
        response = requests.get("http://localhost:5000/api/v1/microservice1")
        return jsonify(response, message="MicroService 2 - Version 1", timestamp=str(datetime.datetime.now()))
    
api.add_resource(Microservice2, '/api/v1/microservice2')

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001, debug=True)