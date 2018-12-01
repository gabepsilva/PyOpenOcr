FROM centos:7

EXPOSE 8443/tcp

RUN mkdir /opt/pyopenocr

RUN yum-config-manager --add-repo https://download.opensuse.org/repositories/home:/Alexander_Pozdnyakov/CentOS_7/
RUN rpm --import https://build.opensuse.org/projects/home:Alexander_Pozdnyakov/public_key
RUN yum -y install tesseract
RUN yum -y install epel-release
RUN yum -y install python36

RUN culr -o /opt/pyopenocr/PyPoenOcr.py



CMD ["python", "/opt/pyopenocr/PyPoenOcr.py"]
