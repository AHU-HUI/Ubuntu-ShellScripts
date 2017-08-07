#!/bin/sh 
egrep -n 'http' $1 | grep -n '[(.*?)]' | sed 's/)/\n)/g'|sed 's/\](/ /g'|sed 's/.*\[//g'|sed 's/).*$//g'|sed /^[[:space:]]*$/d
