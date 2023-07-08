#!/bin/bash
#Script Comprimir

RUTA_C=./dataset/comprimidos
RUTA_P=./dataset/procesados

# Verifica si existe el directorio comprimidos en el directorio dataset, si no existe lo crea.
if [ ! -d $RUTA_C ]; then
	mkdir ./dataset/comprimidos
fi

# Genera un archivo con los nombres y el total de nombres finalizados en "a".
IFS=$'\n'
CANT=0
for LINE in $(cat "$RUTA_P"/img_names_val.txt); do
	NAME=$(basename "$LINE" .jpg)
	if [[ ${NAME: -1} == "a" ]]; then
		CANT=$((CANT + 1))
		echo $LINE >> "$RUTA_P"/img_female.txt
	fi
done	
echo "La cantidad total de personas cuyo nombre termina en "a" es: $CANT" >> "$RUTA_P"/img_female.txt

# Comprime todos los archivos del directorio procesados.
echo "Comprimiendo..."
sleep 2
NOMBRE=$(date +"%d-%m-%y_%H:%M")
tar -cvf $RUTA_C/$NOMBRE.tar $RUTA_P
