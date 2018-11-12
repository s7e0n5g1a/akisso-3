#!/bin/bash



for i in `seq 1 1`
do
	pobieranie_1=`echo | grep -w -i wlp2s0 /proc/net/dev | tr -s ' '| cut -d " " -f 2`		
	wysylanie_1=`echo | grep -w -i wlp2s0 /proc/net/dev | tr -s ' '| cut -d " " -f 10`
	sleep 1
	pobieranie_2=`echo | grep -w -i wlp2s0 /proc/net/dev | tr -s ' '| cut -d " " -f 2`
	wysylanie_2=`echo | grep -w -i wlp2s0 /proc/net/dev | tr -s ' '| cut -d " " -f 10`
	roznica_pobierania=$((pobieranie_2 - pobieranie_1))
	roznica_wysylania=$((wysylanie_2 - wysylanie_1))
	echo "Tempo pobierania: " | tr -d '\n'
	if [ $roznica_pobierania -lt 1000 ] ; then
		echo "$roznica_pobierania" | tr -d '\n'
		echo " B/s"
	elif [ $roznica_pobierania -gt 1000000 ]  ; then
		echo "$(($roznica_pobierania/1000000))" | tr -d '\n'
		echo " MB/s"
	else
		echo "$(($roznica_pobierania/1000))" | tr -d '\n'
		echo " KB/s"
	fi


	echo "Tempo wysylania: " | tr -d '\n'
	if [ $roznica_wysylania -lt 1000 ] ; then
		echo "$roznica_wysylania" | tr -d '\n'
		echo " B/s"
	elif [ $roznica_wysylania -gt 1000000 ]  ; then
		echo "$(($roznica_wysylania/1000000))" | tr -d '\n'
		echo " MB/s"
	else
		echo "$(($roznica_wysylania/1000))" | tr -d '\n'
		echo " KB/s"
	fi

	echo "Czas pracy systemu: " | tr -d '\n'
	awk '{printf("%d dni, %02d godz, %02d min, %02d sek\n",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime

	echo "Poziom baterii: " | tr -d '\n'
	cat /sys/class/power_supply/BAT0/uevent | tail -n 5 | head -n 1 | cut -d "=" -f 2 | tr -d '\n'
	echo "%"

	echo "Obciążenie systemu wynosi: " | tr -d '\n'
	cat /proc/loadavg | cut -d " " -f 1
	echo

done
	
