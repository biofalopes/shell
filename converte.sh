#!/bin/bash

processLine(){
  line="$@"
  output=`echo $line | sed -e 's/wmv/mpeg/g' -e 's/avi/mpeg/g' -e 's/\s/_/g'`
  /usr/bin/ffmpeg -i "$line" -acodec libmp3lame -ar 44100 -ab 128k -vcodec mpeg2video -b 700k -f mpeg $output
}
 
FILE=""
 
if [ "$1" == "" ]; then
   FILE="/dev/stdin"
else
   FILE="$1"
   if [ ! -f $FILE ]; then
  	echo "$FILE : does not exist"
  	exit 1
   elif [ ! -r $FILE ]; then
  	echo "$FILE: can not read"
  	exit 2
   fi
fi
 
BAKIFS=$IFS
IFS=$(echo -en "\n\b")
exec 3<&0
exec 0<"$FILE"
while read -r line
do
	processLine $line
done
exec 0<&3
 
IFS=$BAKIFS
exit 0
