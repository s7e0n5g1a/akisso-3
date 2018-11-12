#!/bin/bash

adres_strony=$1
sekundy=$2
echo $(lynx -dump $adres_strony) > strona1
for i in `seq 1 100`
do
	echo $(lynx -dump $adres_strony) > strona2
	zmiany=$(diff strona1 strona2) 
       	if [ "$zmiany" != "" ]; then # jesli są różne
		#zenity --info --title="Na stronie zostały dokonane zmiany!" --text="Zmiany: $zmiany " --width=400 --height=300
		echo "Zostały dokonane zmiany:\n$zmiany"
	fi
	echo $(lynx -dump $adres_strony) > strona1
	sleep $sekundy
	
done

