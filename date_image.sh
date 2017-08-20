#!/bin/sh
IFS='
'
if test "$#" -lt 1
then
    echo "Please try: ./date_image.sh <image.***>"
    exit 1
fi

for var in "$@"
do 
    DATE=`stat ${var} | egrep -o "Modify.*" | cut -d' ' -f2-`
    convert -gravity south -pointsize 36 -draw "text 0,10 '$DATE'" "$var" "${var}"
    touch -d "$DATE" "${var}"
done
