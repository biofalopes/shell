#!/bin/bash

for i in 2 3 4 5 6 7 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27; do
	echo "10.142.126.$i"
	ssh root@10.142.126.$i "df -k"
	echo "==============================================="
done
