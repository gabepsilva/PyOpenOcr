#!/bin/bash

docker build . -t gabrielpe/pyopenocr
docker run -it -d --name pyopenocr -p 443:443 gabrielpe/pyopenocr