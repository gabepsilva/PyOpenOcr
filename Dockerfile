FROM centos:7

LABEL version="0.0.1"
LABEL release-date="2018-12-01"

EXPOSE 443/tcp

ENV DOCKER true

ADD web/PyOpenOcr.py /opt/pyopenocr/PyOpenOcr.py
ADD install/setup-env.sh /opt/pyopenocr/setup-env.sh
ADD install/requirements.txt /opt/pyopenocr/requirements.txt
ADD run_native.sh /opt/pyopenocr/run_native.sh

RUN /opt/pyopenocr/setup-env.sh

ENTRYPOINT /opt/pyopenocr/run_native.sh