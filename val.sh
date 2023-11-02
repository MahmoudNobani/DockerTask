#!/bin/bash

if rpm -qi httpd &>/dev/null; then
if rpm -qi httpd | grep -qi "Source RPM  : httpd-2.4.6-99.el7.centos.1.src.rpm"; then
echo "true"
else
echo "false"
fi
else
echo "false"
fi

