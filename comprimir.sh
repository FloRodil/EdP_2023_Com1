#!/bin/bash

RUTA_C=./dataset/comprimidos
RUTA_D=./dataset/descomprimidos

# Verifica si existe el directorio comprimidos en el directorio dataset, si no existe lo crea.
if [ ! -d $RUTA_C ]; then
	mkdir ./dataset/comprimidos
fi

# Mueve los archivos img_names.txt y img_names_val.txt al directorio temp.
mv "$RUTA_D"/img_names.txt "$RUTA_D"/temp
mv "$RUTA_D"/img_names_val.txt "$RUTA_D"/temp

# Genera un archivo con los nombres y el total de nombres finalizados en "a".
IFS=$'\n'
CANT=0
for LINE in $(cat "$RUTA_D"/temp/img_names_val.txt); do
	NAME=$(basename "$LINE" .jpg)
	if [[ ${NAME: -1} == "a" ]]; then
		CANT=$((CANT + 1))
		echo $LINE >> "$RUTA_D"/temp/img_female.txt
	fi
done	
echo "La cantidad total de personas cuyo nombre termina en "a" es: $CANT" >> "$RUTA_D"/temp/img_female.txt

# Comprime todos los archivos del directorio temp.
echo "Comprimiendo..."
sleep 2
NOMBRE=$(date +"%d-%m-%y_%H:%M")
tar -cvf $RUTA_C/$NOMBRE.tar ./dataset/descomprimidos/temp/
