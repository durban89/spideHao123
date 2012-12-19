wget -v -nv -nc -c -t3 -np -r -l4  -o hao13.log -e robots=off -U "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5)" --random-wait -R "png,jpg,jpeg,bmp,gif,js,css,ico,mp3,flv,PNG,JPG,JPEG,BMP,GIF,JS,CSS,ICO,MP3,FLV" http://www.hao123.com
cat $(find www.hao123.com/ -type f) | grep -ioP "http://[a-zA-Z0-9\-\_]{1,}\.[a-zA-Z0-9\-\_]{1,}\.(com|net|org|info|cc|edu|gov|int|mil|biz|name|cn|tel)\/[\"a-zA-Z0-9\-\_]{1,}" hao123.txt |sort -u |sed 's/"//g' >hao123.url

