#!/bin/bash
#Script Comprimir

RUTA_C="/app/dataset/comprimidos"
RUTA_P="/app/dataset/procesados"

# Verifica si que existan archivos procesados.
if [ -d "$RUTA_P" ] && [ "$(find "$RUTA_P" -maxdepth 1 -type f -name "*.jpg" | wc -l)" -gt 0 ]; then
	# Verifica si existe el directorio comprimidos en el directorio dataset, si no existe lo crea.
	if [ ! -d $RUTA_C ]; then
		mkdir $RUTA_C
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
	echo "   Comprimiendo..."
	sleep 2
	NOMBRE=$(date +"%d-%m-%y_%H:%M")
	cd $RUTA_P
	tar -cvf "$RUTA_C/$NOMBRE".tar *.*
	rm $RUTA_P/*.*
else
        echo
        echo "   Tiene que procesar"
        echo "   antes de comprimir."
        sleep 2
fi
