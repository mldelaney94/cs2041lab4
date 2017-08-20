#!/bin/bash
if test $# -lt 1
then
    echo "Please try: ./email_image.sh <image.***>"
    exit 1
fi

for var in "$@"
do
    TITLE=${var} #title is image name
    printf 'Address to e-mail this image to? '
    read EMAIL
    printf 'Message to accompany image? '
    read MSG
    
    echo $MSG | mutt -s $TITLE -a $var -- $EMAIL
done
