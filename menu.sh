#!/bin/bash

clear
# Comprueba que exista la carpeta dataset.
DIRECTORIO_DATASET="./dataset"
DIRECTORIO_DESCARGAS="./dataset/descargas"
if [ ! -d "$DIRECTORIO_DESCARGAS" ]; then
        mkdir -p "$DIRECTORIO_DESCARGAS"
        #echo "...El directorio no existe..."
        echo "Se creó el directorio DESCARGAS exitosamente."
        sleep 2
#else
	#echo "El directorio existe."
fi

# Comprueba de que el archivo con los nombres esté en la carpeta dataset.
ARCHIVO_NOMBRES="dict.csv"
if [ ! -f "$DIRECTORIO_DATASET/$ARCHIVO_NOMBRES" ]; then
	wget -P "$DIRECTORIO_DATASET" "https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/$ARCHIVO_NOMBRES"
	echo "El arhivo con los nombres se descargó correctamente."
	sleep 2
#else
	#echo "El archivo de nombres se encuentra en el sistema."
fi

# Verifica que el directorio 'descargas' no contiene archivos .tar
#if [ "$(find "$DIRECTORIO_DESCARGAS" -maxdepth 1 -type f -name "*.tar" | wc -l)" -eq 0 ]; then

# Verifica que el directorio 'descargas' no contiene archivos .jpg ###
if [ "$(find "$DIRECTORIO_DESCARGAS" -maxdepth 1 -type f -name "*.jpg" | wc -l)" -eq 0 ]; then ###
	clear
	echo
	echo "   ┌──────────────────────────┐"
	echo "   │  MENU                    │"
	echo "   ├──────────────────────────┤"
	echo "   │  - Generar imágenes      │"
	echo "   │                          │"
	echo -e "   │  \e[9mX-Descomprimir\e[0m          │"
	echo "   │                          │"
	echo -e "   │  \e[9mX-Procesar\e[0m              │"
	echo "   │                          │"
	echo -e "   │  \e[9mX-Comprimir\e[0m             │"
	echo "   │                          │"
	echo "   │  X - Salir               │"
	echo "   └──────────────────────────┘"
	echo
	read -p "   Cantidad de imágenes a generar: " CANT
	if [ $CANT == "0" ]; then
		sleep 2
		bash menu.sh
	elif [[ $CANT -gt 0 ]]; then
		sleep 2
		bash generar.sh $CANT
	elif [[ $CANT == "X" ]] || [[ $CANT == "x" ]]; then
		clear
		echo
		echo "...Saliendo."
		sleep 3
		clear
		exit 0
    	fi
	sleep 2
	bash menu.sh
else
	clear
	echo
	echo "   ┌──────────────────────────┐"
	echo "   │  MENU                    │"
	echo "   ├──────────────────────────┤"
	echo "   │  1-Generar imágenes      │"
	echo "   │                          │"
	echo "   │  2-Descomprimir archivo  │"
	echo "   │                          │"
	echo "   │  3-Procesar              │"
	echo "   │                          │"
	echo "   │  4-Comprimir             │"
	echo "   │                          │"
        echo "   │  X-Salir                 │"
	echo "   └──────────────────────────┘"
	echo
	read -p "    Tu opción: " OPC

	if [[ $OPC -eq "1" ]]; then
		clear
		echo
		echo "   ┌──────────────────────────┐"
		echo "   │  0-MENU anterior         │"
		echo "   ├──────────────────────────┤"
		echo "   │ - Generar imágenes       │"
		echo "   └──────────────────────────┘"
		echo
		read -p "    Ingrese cantidad: " CANT
		if [[ $CANT -eq "0" ]]; then
			sleep 2
			bash menu.sh
		elif [[ $CANT -gt 0 ]]; then
			sleep 1
			bash generar.sh $CANT
		fi
		sleep 3
		bash menu.sh

	elif [[ $OPC -eq "2" ]]; then
        	clear
      		echo
		echo "   ┌──────────────────────────┐"
        	echo "   │  0-MENU anterior         │"
        	echo "   ├──────────────────────────┤"
        	echo "   │ - Descomprimir archivo   │"
        	echo "   └──────────────────────────┘"
		echo
		echo "    Archivos disponibles:"

		DESCARGAS=./dataset/descargas/
		IFS=$'\n'
    		BUSCAR_EN="$DESCARGAS"
    		for ARCHIVO in $(ls $BUSCAR_EN); do
        	echo "    - "$ARCHIVO
    		done

		echo
		read -p "   Ingrese nombres de archivos: " NOMB_1 NOMB_2
		if [[ $NOMB_1 -eq "0" ]]; then
                	bash menu.sh
		else
			bash descomprimir.sh $NOMB_1 $NOM_2
			sleep 2
		fi
		sleep 2
                bash menu.sh

	elif [[ $OPC -eq "3" ]]; then
		clear
		echo
        	echo "Procesando..."
		sleep 2
                bash menu.sh

	elif [[ $OPC -eq "4" ]]; then
		clear
		echo
        	echo "Comprimiendo..."
		sleep 2
                bash menu.sh

	elif [[ $OPC == "X" ]] || [[ $OPC == "x" ]]; then
		clear
		echo
       		echo "...Chau."
 		sleep 2
		clear
		exit 0
	else
		echo "Opción no válida"
		echo "Intente nuevamente:"
		sleep 3
		bash menu.sh
	fi
fi

