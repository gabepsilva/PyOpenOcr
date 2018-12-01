FROM centos:7

LABEL version="0.0.1"
LABEL release-date="2018-12-01"

EXPOSE 8443/tcp

RUN mkdir /opt/pyopenocr
RUN curl -o '/opt/pyopenocr/PyOpenOcr.py' 'https://raw.githubusercontent.com/gabrielpsilva/pyopenocr/master/PyOpenOcr.py'

RUN yum-config-manager --add-repo https://download.opensuse.org/repositories/home:/Alexander_Pozdnyakov/CentOS_7/
RUN rpm --import https://build.opensuse.org/projects/home:Alexander_Pozdnyakov/public_key
RUN yum -y install tesseract
RUN yum -y install epel-release
RUN yum -y install python36 python36-setuptools
RUN easy_install-3.6 pip
RUN pip3 install flask flask_restful temp pyopenssl

ENTRYPOINT python36 /opt/pyopenocr/PyOpenOcr.py
