#!/bin/sh
:> test.txt
echo 'Packages: \c'
sudo timeout 3 tcpdump -i eth0 port $1 > test.txt 2>&1
sed -i '1,4d' test.txt 
sed -i '2d' test.txt
grep -o '[0-9]' test.txt
