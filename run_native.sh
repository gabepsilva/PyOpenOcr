#!/bin/bash

export APPROOT=/opt/pyopenocr
export PYTHONPATH="$APPROOT/web"

# Sript alread executed by Dockerfiles
if [[ ! $DOCKER ]]
then
    ./install/setup-env.sh
fi

gunicorn --bind 0.0.0.0:443 --chdir $APPROOT --workers=3 --certfile=server.crt --keyfile=server.key PyOpenOcr:app
