#!/bin/bash

if yum info httpd &>/dev/null; then
if yum info httpd |grep -qi "From repo   : httpd"; then
echo "true"
else
echo "false"
fi
else
echo "false"
fi

