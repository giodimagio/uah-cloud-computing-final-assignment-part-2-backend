import datetime
from flask import Flask, jsonify
from flask_cors import CORS, cross_origin

app = Flask(__name__)

@app.route("/microservice-1")
@cross_origin()
def microservice_1():
    return jsonify(message="Microservice 1 - Version 1", timestamp=str(datetime.datetime.now()))

@app.route("/microservice-2")
@cross_origin()
def microservice_2():
    return jsonify(message="Microservice 2 - Version 1", timestamp=str(datetime.datetime.now()))

@app.route("/microservice-3")
@cross_origin()
def microservice_3():
    return jsonify(message="Microservice 3 - Version 1", timestamp=str(datetime.datetime.now()))