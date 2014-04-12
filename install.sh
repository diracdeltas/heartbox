#!/usr/bin/env bash
set -e
sudo pkg install apache24
cp /vagrant/conf/*.pem /etc/ssl
cp /vagrant/conf/httpd.conf /usr/local/etc/apache24
cp /vagrant/conf/httpd-ssl.conf /usr/local/etc/apache24/extra
cp /vagrant/conf/rc.conf /etc/rc.conf
service apache24 configtest
service apache24 start
