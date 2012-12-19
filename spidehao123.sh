#/bin/sh
# 该脚本限制条件
# 1. 只爬了4级目录，如你有充足时间，可以去掉-l4参数，添加-m参数完全镜像
# 2. 不排除这个错误：正则表达式错误导致 某些希望得到的特殊url 被剔了
# 3. www.hao123.com/yssup 和 www.hao123.com/kcuf 被认为是两个链接， 这种情况不排除有些链接是错误的
# 4. 如果仅仅想获取网站域名，可以使用下面语句替代
# 4.1 cat $(find www.hao123.com/ -type f) | grep -ioP "http://[a-zA-Z0-9\-\_]{1,}\.[a-zA-Z0-9\-\_]{1,}\.(com|net|org|info|cc|edu|gov|int|mil|biz|name|cn|tel)[\/\" ]"|sort -u |sed 's/"//g' >hao123.url

wget -v -nv -nc -c -t3 -np -r -l4  -o hao13.log -e robots=off -U "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5)" --random-wait -R "png,jpg,jpeg,bmp,gif,js,css,ico,mp3,flv,PNG,JPG,JPEG,BMP,GIF,JS,CSS,ICO,MP3,FLV" http://www.hao123.com
cat $(find www.hao123.com/ -type f) | grep -io "href=\".*?.*?\""  | grep -v "[#]" | grep "http" |sort -u | grep -io "http.*" |sed 's/"//g' > hao123.url.txt

