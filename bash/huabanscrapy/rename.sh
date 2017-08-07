#!/bin/sh
cd /home/ubuntu/scrapy/huaban/python/images

 num=0; 

 for img in `ls *.jpeg`;
 do 
     mv $img `printf  %.6d $num`.jpeg;
     num=`expr $num + 1`; 
 done

 for img in `ls *.png`;
 do 
     mv $img `printf  %.6d $num`.png;
     num=`expr $num + 1`; 
 done


 for img in `ls *.gif`;
 do 
     mv $img `printf  %.6d $num`.gif;
     num=`expr $num + 1`; 
 done

rename 's/^/00/' [0-9].jpeg 
rename 's/^/00/' [0-9].jpg 
rename 's/^/00/' [0-9].png 
rename 's/^/00/' [0-9].gif 

rename 's/^/0/' [0-9][0-9].jpg 
rename 's/^/0/' [0-9][0-9].jpeg 
rename 's/^/0/' [0-9][0-9].png 
rename 's/^/0/' [0-9][0-9].gif 

echo "rename done!"