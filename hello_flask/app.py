from flask import Flask
import os

app = Flask(__name__)

NAME = os.getenv("NAME")


@app.route("/")
def hello_world():
    return f"Hey {NAME}, we have Flask in a Docker container!"


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
