#!/bin/bash

[ $# -ne 1 ]&&{
echo "请输入一个路径"
exit 1
}
[ -d ` echo  "$1" ` ]||{
echo "请输入一个路径"
exit 1
}

#为取001 002 类似做准备
x=100000
for n in `ls $1 `
do
x=`expr $x + 1`
#取001 002 可以自己改 0001 0002
y=`echo  $x|cut -c 4-`
name=` echo $n |awk -F  "." '{print $1}'`
houzhui=` echo $n |awk -F  "." '{print $2}'`
mv  $1$name"."$houzhui     $1$y"."$houzhui
done
