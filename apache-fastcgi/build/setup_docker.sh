#!/bin/bash
set -x
set -e

apt-get update
apt-get install -y --no-install-recommends apache2-mpm-worker ca-certificates libapache2-mod-fastcgi

a2enmod expires rewrite headers actions fastcgi alias

echo > /etc/apache2/sites-enabled/000-default.conf

rm -rf /var/www/*
mkdir -p /var/lock/apache2 /var/run/apache2 /var/log/apache2 /var/www
chown -R www-data:www-data /var/lock/apache2 /var/run/apache2 /var/log/apache2 /var/www

mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.dist


cp -frv /build/files/* /


# Clean up APT when done.
source /usr/local/build_scripts/cleanup_apt.sh
rm -rf /tmp/*

