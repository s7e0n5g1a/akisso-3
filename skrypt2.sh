#!/bin/bash
#NAME, PID, RSS, STAT, FDSIZE, THREADS 

echo "NAME                                     "| cut -c -20 | tr -d '\n'				
echo "PID                                      "| cut -c -6 | tr -d '\n'				
echo "RSS                                      "| cut -c -13 | tr -d '\n'
echo "STAT                                     "| cut -c -15 | tr -d '\n'
echo "FDSIZE                                   "| cut -c -7 | tr -d '\n'
echo "THREADS                                  "| cut -c -6
echo
lista=$(ls /proc/[0-9]*/status)

for i in $lista ; do
if [ -e $i ] ; then
	echo "`grep -w -i Name $i | cut -f 2- | tr -d '\n'`                          "| cut -c -20 | tr -d '\n'

	echo "`grep -w -i Pid $i  | cut -f 2- | tr -d '\n'`                          "| cut -c -6 | tr -d '\n'

	echo "`grep -w -i VmRSS $i | cut -f 2- | tr -d '\n'`                          "| cut -c -13 | tr -d '\n'

	echo "`grep -w -i State $i | cut -f 2- | tr -d '\n'`                          "| cut -c -15 | tr -d '\n'

	echo "`grep -w -i FDsize $i | cut -f 2- | tr -d '\n'`                          "| cut -c -7 | tr -d '\n'

	echo "`grep -w -i Threads $i | cut -f 2- | tr -d '\n'`                          "| cut -c -6
	
	echo "___________________________________________________________________"
fi
done
#xDDDDD



