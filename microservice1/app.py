import datetime
from flask import Flask, jsonify
from flask_cors import cross_origin
from flask_restful import Api, Resource

app = Flask(__name__)
api = Api(app)

class Microservice1(Resource):
    @cross_origin()
    def get(self):
        return jsonify(message="MicroService 1 - Version 1", timestamp=str(datetime.datetime.now()))
    
api.add_resource(Microservice1, '/api/v1/microservice1')

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)