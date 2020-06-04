#!/bin/bash -xe
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum-config-manager --enable epel
yum -y install moreutils
exec > >(ts "%Y-%m-%dT%H:%M:%S." | tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

###########################################################
# Perform configuration management
###########################################################
# Inputs - need to know:
# * nginx package name : "nginx1" from amazon-linux-extras
# * git package name: "git-core"

# - upgrade os
yum -y upgrade

# - install nginx
amazon-linux-extras install -y nginx1

# - start nginx
service nginx start

# - install git tool
yum -y install git-core

###########################################################
# Manual deploy of the code from Git repo
###########################################################
# Inputs - need to know:
# * web folder location: "/usr/share/nginx/html"
# * application code git URL: "https://github.com/vladibb/hallo-web.git"
# * need to know: application folder structure for html: "hallo-web/html/"

# - clone application code
rm -rf hallo-web
git clone https://github.com/vladibb/hallo-web.git

# - cleanup previous application code
rm -f /usr/share/nginx/html/*.html

# - install applicaton code
cp hallo-web/html/* /usr/share/nginx/html/
