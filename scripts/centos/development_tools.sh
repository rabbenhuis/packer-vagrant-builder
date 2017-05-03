#!/bin/bash -eux

yum groupinstall -y 'Development Tools'

# Packages needed by rpmbuild to compile
yum install -y readline-devel ncurses-devel gdbm-devel openssl-devel libyaml-devel libffi-devel zlib-devel