from flask import Flask, jsonify
import requests

app = Flask(__name__)


# Enrutado de las peticiones GET que llegan al API Gateway
@app.route("/api/v1/microservice2", methods=["GET"])
def microservice2():
    response = forward_request(MICROSERVICE2_URL)
    return response


@app.route("/api/v1/microservice3", methods=["GET"])
def microservice3():
    response = forward_request(MICROSERVICE3_URL)
    return response


# Función que enruta la petición al microservicio correspondiente
def forward_request(url):
    try:
        response = requests.get(url)
        return jsonify(response.json())
    except requests.exceptions.RequestException as e:
        error_message = str(e)
        return jsonify({"error": error_message}), 500


# Manejadores de error 404 y 500
@app.errorhandler(404)
def not_found_error(error):
    return jsonify({"error": "Endpoint not found"}), 404


@app.errorhandler(500)
def internal_server_error(error):
    return jsonify({"error": "Internal server error"}), 500


# Función principal
if __name__ == "__main__":
    # URLs internas de los microservicios
    MICROSERVICE1_URL = "http://microservice1:5001/api/v1/microservice1"
    MICROSERVICE2_URL = "http://microservice2:5002/api/v1/microservice2"
    MICROSERVICE3_URL = "http://microservice3:5003/api/v1/microservice3"

    app.run(host="0.0.0.0", port=9000, debug=True)
