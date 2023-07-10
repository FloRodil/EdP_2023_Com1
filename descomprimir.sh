#!/bin/bash
#Script Descomprimir

RUTA_M="/app/scripts"
# Verifica que recibe dos argumentos.
if [ $# -eq 2 ]; then
	# Verifica que los archivos pasados como argumentos existan en la carpeta.
	RUTA_ARCH="/app/dataset/descargas"
	if [ ! -f $RUTA_ARCH/$1 ] || [ ! -f $RUTA_ARCH/$2 ]; then
		echo
		echo "   El/los archivo/s no existe/n."
		sleep 5
		bash $RUTA_M/menu.sh
	else
		# Verifica que exista la carpeta "descomprimidos" si no existe la crea.
                DESCOMPRIMIDOS="/app/dataset/descomprimidos"
		if [ ! -d $DESCOMPRIMIDOS ];then
			mkdir $DESCOMPRIMIDOS
		fi
		# Verifica la integridad de archivo.
		NRO_SHA=$(sha512sum $RUTA_ARCH/$1 | cut -d' ' -f 1)
		NRO_TXT=$(cut -d' ' -f 1 $RUTA_ARCH/$2)
		if [[ $NRO_SHA == $NRO_TXT ]]; then
			clear
			echo
			echo "   Verificación exitosa."
			sleep 1
			clear
			echo
			echo "   Descomprimiendo archivos..."
			sleep 1
			echo
			tar -xvf $RUTA_ARCH/$1 -C $DESCOMPRIMIDOS
			clear
			bash $RUTA_M/menu.sh
		else
			echo
			echo "   Ocurrió un error con el archivo,"
		        echo "   no pasó prueba de integridad."
			sleep 5
			bash $RUTA_M/menu.sh
		fi
	fi
else
	echo
	echo "   Se esperan DOS(2) argumentos."
	sleep 2
	bash $RUTA_M/menu.sh
fi
