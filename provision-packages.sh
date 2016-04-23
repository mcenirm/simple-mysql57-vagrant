#!/bin/bash

set -e

MYSQL_REPO_RPM_NAME=mysql57-community-release-el7-8.noarch
MYSQL_REPO_RPM_URL=https://repo.mysql.com//${MYSQL_REPO_RPM_NAME}.rpm

rpmquery --quiet "$MYSQL_REPO_RPM_NAME" \
|| {
  rpm -ivh "$MYSQL_REPO_RPM_URL"
  rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
}

yum -y install mysql-community-{server,client}-5.7.12-1.el7.x86_64
