from flask import Flask, request
from flask_restful import Resource, Api

import os
import base64
import tempfile


app = Flask(__name__)
api = Api(app)

class PyOpenOcr(Resource):

    def post(self):

        decoded = base64.decodebytes(request.data)

        tf = tempfile.NamedTemporaryFile(mode='w+b', prefix='oocr_', dir='/tmp', delete=False)
        tf.write(decoded)
        tf.close()

        os.system(f'tesseract {tf.name} {tf.name} -l eng')

        f = open(f'{tf.name}.txt', mode="r", encoding="utf-8")
        ocr_txt = f.read()
        f.close()

        os.remove(tf.name)
        os.remove(f'{tf.name}.txt')

        return ocr_txt

api.add_resource(PyOpenOcr, '/ocr-base64')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8443, ssl_context='adhoc')