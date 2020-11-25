#!/bin/bash
 
processLine(){
  line="$@" # get all args
  echo " "
  echo "##### Executando script em $line #####"
  echo " "
  ./script.sh $line
}
 
FILE=""
 
if [ "$1" == "" ]; then
   FILE="/dev/stdin"
else
   FILE="$1"
   if [ ! -f $FILE ]; then
  	echo "$FILE : does not exists"
  	exit 1
   elif [ ! -r $FILE ]; then
  	echo "$FILE: cannot read"
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
