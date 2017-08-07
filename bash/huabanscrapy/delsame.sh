#!/bin/bash 
#name:remove_one.sh
#用途：查找并删除重复文件，每个文件只保留一个样本

#将文件依据大小排序并输出
ls -lS | awk 'BEGIN {
 #得到第一行total总数并丢弃，读取下一行
 getline;getline;
 name1=$9;size=$5;
}
{
 name2=$9;
 if(size==$5)
 #大小一样的可能是内容相同的文件
 {
  #用md5进行校验和
  ("md5sum "name1)|getline; csum1=$1;
  ("md5sum "name2)|getline; csum2=$1;
  #如果校验和相同则为内容相同的文集，输出名字
  if( csum1==csum2 )
  {
   {print name1;print name2}
  }
 };
 size=$5;name1=name2;
}' | sort -u > duplicate_files


#计算重复文件的md5sum，将重复文件中的一采样写入duplicate_sample中
cat duplicate_files|xargs -I {} md5sum {}| sort | uniq -w 32 | awk '{print $2}' | sort -u > duplicate_sample

echo Removing...

#删除在duplicate_files中列出且未被duplicate_sample列出的全部文件
comm duplicate_files duplicate_sample -2 -3|tee /dev/stderr|xargs rm
echo Removed duplicates files successfully