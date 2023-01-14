import datetime
from flask import Flask
from flask_cors import CORS, cross_origin

app = Flask(__name__)

@app.route("/microservice-1")
@cross_origin()
def microservice_1():
    return ("Microservice 1 - Version 1 - Time: " + str(datetime.datetime.now()))

@app.route("/microservice-2")
@cross_origin()
def microservice_2():
    return ("Microservice 2 - Version 1 - Time: " + str(datetime.datetime.now()))

@app.route("/microservice-3")
@cross_origin()
def microservice_3():
    return ("Microservice 3 - Version 1 - Time: " + str(datetime.datetime.now()))