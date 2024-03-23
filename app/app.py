from flask import Flask, request, jsonify

app = Flask(__name__)
app.config["DEBUG"] = False

# The Flask secret key is a Docker secret
with open('/run/secrets/flask_secret_key', 'r') as file:
    app.config["FLASK_SECRET"] = file.read().strip()


@app.route('/', methods=['GET'])
def home():
    return jsonify({'message': 'Hello, World!'})
