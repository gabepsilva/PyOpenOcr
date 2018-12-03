import requests
import base64

from flask import Flask, request
from flask_restful import Resource, Api

from web import common


app = Flask(__name__)
api = Api(app)

class PyOpenOcrBase64(Resource):

    def post(self):
        decoded = base64.decodebytes(request.data)

        return common.data_to_text(decoded)

class PyOpenOcrURL(Resource):

    def post(self):
        url =  request.data.decode("utf-8")
        data = requests.get(url, allow_redirects=True, verify=False)

        return common.data_to_text(data.content)


api.add_resource(PyOpenOcrBase64, '/ocr-base64')
api.add_resource(PyOpenOcrURL, '/ocr-url')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8443, ssl_context='adhoc')