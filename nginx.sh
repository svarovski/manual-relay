#!/bin/sh

nginx -c `pwd`/nginx.conf -g 'error_log stderr;'
