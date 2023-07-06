#!/bin/bash

ARCHIVO_CSV="./dataset/dict.csv"
CANT_FILAS=$(wc -l < "$ARCHIVO_CSV")
GENERO=''

# Comprueba que exista la carpeta descargas.
DIRECTORIO_DESCARGAS="./dataset/descargas"
if [ ! -d "$DIRECTORIO_DESCARGAS" ]; then
	echo "Directorio descargas inexistente, creando directorio..."
	mkdir -p "$DIRECTORIO_DESCARGAS"
	echo "Directorio creado exitosamente."
	# Hace una pausa para mostrar el resultado de la comprobación anterior.
	sleep 2
fi

CANT=$1
VALOR=0
while [ $VALOR -lt $CANT ]; do
	
	FILA_RANDOM=$((1 + RANDOM % CANT_FILAS)) ###
	PRIMER_VALOR=$(sed -n "${FILA_RANDOM}p" "$ARCHIVO_CSV" | cut -d',' -f1) ###

	# Divide el contenido de 'primer_valor' en un array de palabras.
	IFS=' ' read -ra MATRIZ_VALOR <<< "$PRIMER_VALOR"

	# Verifica si el array contiene más de una palabra.
	if [ "${#MATRIZ_VALOR[@]}" -gt 1 ]; then
		# Extrae la segunda palabra de la matriz.
		NOMBRE_MINUSC="${MATRIZ_VALOR[1]}"
		# Cambia la primera letra de la segunda palabra por su mayúscula.
		NOMBRE_MAYUSC="${NOMBRE_MINUSC^}"
    		# Comprueba si la palabra modificada termina con una 'a'.
		if [[ $NOMBRE_MAYUSC =~ a$ ]]; then
        		GENERO="female"
		else
        		GENERO="male"
		fi
		wget https://source.unsplash.com/random/600x900/?$GENERO -O $DIRECTORIO_DESCARGAS/$NOMBRE_MAYUSC.jpg
		sleep 1
    		#echo "Nombre al azar: $NOMBRE_MAYUSC es: $GENERO en fila: $FILA_RANDOM total filas: $CANT_FILAS"
		else
		wget https://source.unsplash.com/random/600x900/?pet -O $DIRECTORIO_DESCARGAS/$FILA_RANDOM.jpg
		sleep 1
    		#echo "La fila no tiene nombre, el apellido es: $MATRIZ_VALOR fila: $FILA_RANDOM"
	fi
	((VALOR+=1))
done

