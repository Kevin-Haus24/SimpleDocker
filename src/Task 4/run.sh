#!/bin/bash

gcc -o fcgi_server hello.c -lfcgi
spawn-fcgi -p 8080 ./fcgi_server
nginx -g "daemon off;"