#!/bin/bash

./install/setup-env.sh
gunicorn --bind 0.0.0.0:443 --chdir /opt/pyopenocr --workers=3 --certfile=server.crt --keyfile=server.key PyOpenOcr:app