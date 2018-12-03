#!/bin/bash


export APPROOT=/opt/pyopenocr
mkdir -p $APPROOT

yum-config-manager --add-repo https://download.opensuse.org/repositories/home:/Alexander_Pozdnyakov/CentOS_7/
rpm --import https://build.opensuse.org/projects/home:Alexander_Pozdnyakov/public_key
yum -y install epel-release 
yum -y install tesseract python36 python36-setuptools openssl
easy_install-3.6 pip
pip3 install -r $APPROOT/install/requirements.txt

cd $APPROOT
openssl genrsa 2048 > server.key
openssl req -new -newkey rsa:4096 -key server.key -out server.csr -subj "/C=CA/ST=ON/L=Toronto/O=pyopenocr/CN=pyopenocr"
openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt
