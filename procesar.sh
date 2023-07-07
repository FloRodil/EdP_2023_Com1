#!/bin/bash

RUTA=./dataset/descomprimidos/

mkdir "$RUTA"temp
touch "$RUTA"img_names.txt
touch "$RUTA"img_names_val.txt
IFS=$'\n'
for FILE in $(ls $RUTA); do 
	if [[ "${FILE##*.}" == "jpg" ]] ; then
	       	echo $FILE >> "$RUTA"img_names.txt
	fi
	if [[ $FILE =~ ^[A-Z][a-z]+ ]]; then
		echo $FILE >> "$RUTA"img_names_val.txt
		cp $RUTA$FILE "$RUTA"temp
	fi
done

cd "$RUTA"temp
for FIL in $(ls); do
	#echo $FIL
	#convert $FIL -gravity center -crop 512x512+0+0 \-extent 512x512 ${FIL%.*}_p.jpg
	convert $FIL -gravity center -crop 512x512+0+0 \-extent 512x512 p_"${FIL%.*}".jpg
	rm $FIL
done
sleep 1
echo $RUTA
cat "$RUTA"img_names_val.txt
shopt -s nullglob
mv "$RUTA"img_names_val.txt "$RUTA"temp
shopt -u nullglob

 
