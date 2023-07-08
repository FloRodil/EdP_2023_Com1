#!/bin/bash
#Script Procesar

RUTA=./dataset/descomprimidos
RUTA_P=./dataset/procesados

# Verifica que exista el directorio procesados.
if [[ ! -d $RUTA_P ]]; then
	mkdir $RUTA_P
fi
# Crea los archivos de texto.
touch $RUTA_P/img_names.txt
touch $RUTA_P/img_names_val.txt
IFS=$'\n'
for FILE in $(ls $RUTA); do 
	# Lista en el .txt los archivos .jpg.
	if [[ "${FILE##*.}" == "jpg" ]] ; then
	       	echo $FILE >> $RUTA_P/img_names.txt
	fi
	# Lista los archivos con nombre válido en el .txt y copia el archivo.
	if [[ $FILE =~ ^[A-Z][a-z]+ ]]; then
		echo $FILE >> $RUTA_P/img_names_val.txt
		cp $RUTA/$FILE $RUTA_P
	fi
done
# Procesa las imágenes.
cd $RUTA_P
for FIL in $(ls); do
	if [[ "$FIL" == *.jpg ]]; then
		convert $FIL -gravity center -crop 512x512+0+0 \-extent 512x512 p_"${FIL%.*}".jpg
		rm $FIL
	fi
done
