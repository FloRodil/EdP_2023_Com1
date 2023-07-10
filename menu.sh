#!/bin/bash
#Script Menu

clear
# Comprueba que exista la carpeta dataset.
DIRECTORIO_DATASET="/app/dataset"
DIRECTORIO_DESCARGAS="/app/dataset/descargas"
if [ ! -d "$DIRECTORIO_DESCARGAS" ]; then
        mkdir -p "$DIRECTORIO_DESCARGAS"
        echo "Se creó el directorio DESCARGAS exitosamente."
fi

# Comprueba de que el archivo con los nombres esté en la carpeta dataset.
ARCHIVO_NOMBRES="dict.csv"
if [ ! -f "$DIRECTORIO_DATASET/$ARCHIVO_NOMBRES" ]; then
	wget -P "$DIRECTORIO_DATASET" "https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/$ARCHIVO_NOMBRES"
	echo "El arhivo con los nombres se descargó correctamente."
	sleep 2
fi

<<<<<<< HEAD
RUTA_M="/app/scripts"
=======
>>>>>>> 5c7bd57faff62ad181910939b19c9de51c4aca82
# Verifica que el directorio 'descargas' no contiene archivos .tar
if [ "$(find "$DIRECTORIO_DESCARGAS" -maxdepth 1 -type f -name "*.tar" | wc -l)" -eq 0 ]; then
	clear
	echo
	echo "   ┌──────────────────────────┐"
	echo "   │  MENU                    │"
	echo "   ├──────────────────────────┤"
	echo "   │  - Generar imágenes      │"
	echo "   │                          │"
	echo -e "   │  \e[9m- Descomprimir\e[0m          │"
	echo "   │                          │"
	echo -e "   │  \e[9m- Procesar\e[0m              │"
	echo "   │                          │"
	echo -e "   │  \e[9m- Comprimir\e[0m             │"
	echo "   │                          │"
	echo "   │  X - Salir               │"
	echo "   └──────────────────────────┘"
	echo
	read -p "   Cantidad de imágenes a generar: " CANT
<<<<<<< HEAD
	if [[ $CANT < 0 ]]; then
		echo
		echo "   La cantidad debe ser mayor que cero."
		sleep 1.5
		bash $RUTA_M/menu.sh
	elif [[ $CANT -gt 0 ]]; then
		bash $RUTA_M/generar.sh $CANT
=======
	if [ $CANT == "0" ]; then
		sleep 2
		bash menu.sh
	elif [[ $CANT -gt 0 ]]; then
		sleep 2
		bash generar.sh $CANT
>>>>>>> 5c7bd57faff62ad181910939b19c9de51c4aca82
	elif [[ $CANT == "X" ]] || [[ $CANT == "x" ]]; then
		clear
		echo
		echo "...Saliendo."
<<<<<<< HEAD
		sleep 1
		clear
		exit 0
	else
		echo "   Opción no válida"
		echo "   Intente nuevamente:"
		sleep 2
    	fi
=======
		sleep 3
		clear
		exit 0
    	fi
	sleep 2
	bash menu.sh
>>>>>>> 5c7bd57faff62ad181910939b19c9de51c4aca82
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
<<<<<<< HEAD
			sleep 1
			bash $RUTA_M/menu.sh
		elif [[ $CANT -gt 0 ]]; then
			sleep 1
			bash $RUTA_M/generar.sh $CANT
			sleep 1
		else
			echo "Opción no válida."
		fi
	
=======
			sleep 2
			bash menu.sh
		elif [[ $CANT -gt 0 ]]; then
			sleep 1
			bash generar.sh $CANT
		fi
		sleep 3
		bash menu.sh

>>>>>>> 5c7bd57faff62ad181910939b19c9de51c4aca82
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

<<<<<<< HEAD
		IFS=$'\n'
		for ARCHIVO in $(ls $DIRECTORIO_DESCARGAS); do
        	echo "    - "$ARCHIVO
    		done

		IFS=$' '
		echo
		read -p "   Ingrese nombres de archivos: " NOMB_1 NOMB_2
		if [[ $NOMB_1 == "0" ]]; then
                	bash $RUTA_M/menu.sh
			clear
		else
			bash $RUTA_M/descomprimir.sh $NOMB_1 $NOMB_2
		fi
	
	elif [[ $OPC -eq "3" ]]; then
		clear
		echo
                bash $RUTA_M/procesar.sh
=======
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
                bash procesar.sh
>>>>>>> 5c7bd57faff62ad181910939b19c9de51c4aca82
		sleep 2
                bash $RUTA_M/menu.sh

<<<<<<< HEAD
	elif [[ $OPC -eq "4" ]]; then
		clear
		echo
                bash $RUTA_M/comprimir.sh
		clear
                bash $RUTA_M/menu.sh

	elif [[ $OPC == "X" ]] || [[ $OPC == "x" ]] || [[ $OPC == "exit" ]]; then
		clear
		echo
       		echo "...Chau."
 		sleep 1
=======

	elif [[ $OPC -eq "4" ]]; then
		clear
		echo
                bash comprimir.sh
		sleep 2
                bash menu.sh


	elif [[ $OPC == "X" ]] || [[ $OPC == "x" ]]; then
		clear
		echo
       		echo "...Chau."
 		sleep 2
		clear
>>>>>>> 5c7bd57faff62ad181910939b19c9de51c4aca82
		exit 0
	else
		echo "   Opción no válida"
		echo "   Intente nuevamente:"
		sleep 2
		bash $RUTA_M/menu.sh
	fi
fi

