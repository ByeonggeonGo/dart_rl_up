from flask import Flask
from data import datacontrol

app = Flask(__name__)

if __name__ == "__main__":
    app.register_blueprint(datacontrol.bp)
    app.run(host='0.0.0.0', port = 9000)