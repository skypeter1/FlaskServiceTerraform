from flask import request, url_for
from flask_api import FlaskAPI, status, exceptions

app = FlaskAPI(__name__)

@app.route("/", methods=['GET'])
def hello_world():

    if request.method == 'GET':
        return "Hello World"

if __name__ == "__main__":
    app.run(debug=True, host='127.0.0.1',port=8000)