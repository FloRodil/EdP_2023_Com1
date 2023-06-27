#!/bin/bash

# Comprueba que exista la carpeta data.
DIRECTORIO_DATA="./data"
if [ ! -d "$DIRECTORIO_DATA" ]; then
	echo "Ruta inexistente, creando directorio..."
	mkdir -p "$DIRECTORIO_DATA"
	echo "Directorio creado."
else
	echo "El directorio existe."
fi

# Comprueba de que el archivo con los nombres esté en la carpeta data.
ARCHIVO_NOMBRES="dict.csv"
if [ ! -f "$DIRECTORIO_DATA/$ARCHIVO_NOMBRES" ]; then
	wget -P "$DIRECTORIO_DATA" "https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/$ARCHIVO_NOMBRES"
	echo "El arhivo con los nombres se descargó correctamente."
else
	echo "El archivo de nombres se encuentra en el sistema."
fi

# Hace una pausa para mostrar el resultado de la comprobación anterior.
sleep 2

clear
echo
echo "   ┌──────────────────────────┐"
echo "   │  MENU                    │"
echo "   ├──────────────────────────┤"
echo "   │  1-Generar imágenes      │"
echo "   │                          │"
echo "   │  2-Descargar archivo     │"
echo "   │                          │"
echo "   │  3-Procesar              │"
echo "   │                          │"
echo "   │  4-Comprimir             │"
echo "   └──────────────────────────┘"
read -p "    Tu opción: " OPC

if [ $OPC -eq "1" ]; then
	clear
	echo
	echo "   ┌──────────────────────────┐"
	echo "   │  0-MENU anterior         │"
	echo "   ├──────────────────────────┤"
	echo "   │ -Generar imágenes        │"
	echo "   └──────────────────────────┘"
	read -p "   Ingrese cantidad: " CANT
	if [ $CANT -eq "0" ]; then
		bash menu.sh
	elif [ $CANT -gt 0 ]; then
		bash do_generar.sh $CANT
	fi
elif [ $OPC -eq "2" ]; then
        clear
      	echo
	echo "   ┌──────────────────────────┐"
        echo "   │  0-MENU anterior         │"
        echo "   ├──────────────────────────┤"
        echo "   │ -Descargar archivo       │"
        echo "   └──────────────────────────┘"
        read -p "   Ingrese hash: " HASH
	if [ $HASH -eq "0" ]; then
                bash menu.sh
	fi
elif [ $OPC -eq "3" ]; then
	clear
	echo
        echo "Procesando..."
elif [ $OPC -eq "4" ]; then
	clear
	echo
        echo "Comprimiendo..."
else
	echo "Opción no válida"
	echo "Intente nuevamente:"
	bash menu.sh
fi
