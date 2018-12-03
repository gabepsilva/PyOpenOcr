FROM centos:7

LABEL version="1.2.1"
LABEL release-date="2018-12-01"

EXPOSE 443/tcp

ENV DOCKER true
ENV PYTHONPATH /opt/pyopenocr/web

ADD . /opt/pyopenocr/

RUN /opt/pyopenocr/install/setup-env.sh

ENTRYPOINT /opt/pyopenocr/run_native.sh