#!/bin/bash
curl -s http://api.icndb.com/jokes/random/ | python -c 'import sys, json; print "\n\n"+json.load(sys.stdin)["value"]["joke"]+"\n\n"'

adres_url=`curl -s  --request GET   --url 'https://api.thecatapi.com/v1/images/search?format=json'   --header 'Content-Type: application/json'   --header 'x-api-key: 7fe06c0a-19d0-42c2-81fb-a1b20616c95b' | cut -d : -f 5- | tr -d '"}]'`

wget $adres_url -O kotek
img2txt kotek

