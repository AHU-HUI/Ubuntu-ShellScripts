#!/bin/sh

#cd /home/ubuntu/scrapy/huaban/python         #爬取
#./huabanscrapy.py


cd /home/ubuntu/scrapy/huaban/python/images  #除重
rename 's/\(//' *.jpeg
rename 's/\)//' *.png
rename 's/\(//' *.gif
rename 's/\)//' *.jpeg
rename 's/\(//' *.png
rename 's/\)//' *.gif
rename 's/\ //' *.jpeg
rename 's/\ //' *.png
rename 's/\ //' *.gif

chmod +x delsame.sh
./delsame.sh
sleep 5;

rm /home/ubuntu/scrapy/huaban/python/images/duplicate_files
rm /home/ubuntu/scrapy/huaban/python/images/duplicate_sample

cd /home/ubuntu/scrapy/huaban/python		 #重命名
./rename.sh


echo '***********************'
echo '**** Finish works! ****'
echo '***********************'
