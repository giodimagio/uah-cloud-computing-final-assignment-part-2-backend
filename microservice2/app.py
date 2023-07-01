import requests
import os
from flask import Flask, jsonify
from flask_cors import cross_origin
from flask_restful import Api, Resource
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()
microservice1_url = os.getenv('MICROSERVICE1_URL')

app = Flask(__name__)
api = Api(app)

class Microservice2(Resource):
    @cross_origin()
    def get(self):
        response = requests.get(microservice1_url)
        microservice1_response = response.json()
        microservice1_timeinfo = {
            "message": microservice1_response["message"],
            "timestamp": microservice1_response["timestamp"]
        }
        return jsonify(message="MicroService 2 - Version 1", timeinfo=microservice1_timeinfo)

api.add_resource(Microservice2, '/api/v1/microservice2')

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5002, debug=True)