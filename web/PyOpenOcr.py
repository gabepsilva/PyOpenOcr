from base64 import decodebytes
from io import BytesIO

from flask import Flask, request
from flask_restful import Resource, Api

import pytesseract
from PIL import Image


app = Flask(__name__)
api = Api(app)

class PyOpenOcr(Resource):

    def post(self):
        decoded = decodebytes(request.data)
        dt = Image.open(BytesIO(decoded))
        return pytesseract.image_to_string(dt)


api.add_resource(PyOpenOcr, '/ocr-base64')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8443, ssl_context='adhoc')