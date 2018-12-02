FROM centos:7

LABEL version="0.0.1"
LABEL release-date="2018-12-01"

EXPOSE 443/tcp

RUN yum-config-manager --add-repo https://download.opensuse.org/repositories/home:/Alexander_Pozdnyakov/CentOS_7/
RUN rpm --import https://build.opensuse.org/projects/home:Alexander_Pozdnyakov/public_key
RUN yum -y install epel-release 
RUN yum -y install tesseract python36 python36-setuptools openssl
RUN easy_install-3.6 pip
RUN pip3 install flask flask_restful temp pyopenssl gunicorn

RUN mkdir -p /opt/pyopenocr
WORKDIR /opt/pyopenocr

RUN openssl genrsa 2048 > server.key
#RUN openssl req -new -key server.key -out server.csr

RUN openssl req -new -newkey rsa:4096 -key server.key -out server.csr \
    -subj "/C=CA/ST=ON/L=Toronto/O=pyopenocr/CN=pyopenocr"

RUN openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt

ADD PyOpenOcr.py /opt/pyopenocr/PyOpenOcr.py

ENTRYPOINT gunicorn --bind 0.0.0.0:443 --chdir /opt/pyopenocr --workers=3 --certfile=server.crt --keyfile=server.key PyOpenOcr:app
