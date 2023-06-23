#!/bin/bash

ARCHIVO_CSV="demo.csv"
CANT_FILAS=$(wc -l < "$ARCHIVO_CSV")
FILA_RANDOM=$((1 + RANDOM % CANT_FILAS))
PRIMER_VALOR=$(sed -n "${FILA_RANDOM}p" "$ARCHIVO_CSV" | cut -d',' -f1)
GENERO=''

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
	wget https://source.unsplash.com/random/900%C3%97700/?$GENERO -O /home/user/EdP_2023/temp/$NOMBRE_MAYUSC.tfif	
    	#echo "Nombre al azar: $NOMBRE_MAYUSC es: $GENERO en fila: $FILA_RANDOM total filas: $CANT_FILAS"
else
	wget https://source.unsplash.com/random/900%C3%97700/?pet -O /home/user/EdP_2023/temp/$FILA_RANDOM.tfif
    	#echo "La fila no tiene nombre, el apellido es: $MATRIZ_VALOR fila: $FILA_RANDOM"
fi
