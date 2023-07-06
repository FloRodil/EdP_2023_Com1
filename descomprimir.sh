#!/bin/bash

# Verifica que recibe dos argumentos.
if [ $# -eq 2 ]; then
	# Verifica que los archivos pasados como argumentos existan en la carpeta.
	RUTA_ARCH="./dataset/descargas/"
	if [ ! -f $RUTA_ARCH$1 ] || [ ! -f $RUTA_ARCH$2 ]; then
		echo
		echo "El/los archivo/s no existe/n"
		sleep 5
		bash menu.sh
	else
		# Verifica que exista la carpeta "descomprimidos" si no existe la crea.
                DESCOMPRIMIDOS="./dataset/descomprimidos"
		if [ ! -d $DESCOMPRIMIDOS ];then
			mkdir -p $DESCOMPRIMIDOS
		fi
		# Verifica la integridad de archivo.
		NRO_SHA=$(sha512sum $RUTA_ARCH$1 | cut -d' ' -f 1)
		NRO_TXT=$(cut -d' ' -f 1 $RUTA_ARCH$2)
		#echo $NRO_SHA
		#echo $NRO_TXT
		#sleep 25
		if [[ $NRO_SHA == $NRO_TXT ]]; then
			clear
			echo
			echo "Verificación exitosa"
			sleep 1
			clear
			echo
			echo "Descomprimiendo archivos:"
			echo
			tar -xvf $RUTA_ARCH$1 -C $DESCOMPRIMIDOS
			sleep 4
			clear
			bash menu.sh
		else
			echo $?
			echo
			echo "Ocurrió un error con el archivo, no pasó prueba de integridad"
			sleep 5
			bash menu.sh
		fi
	fi
else
	echo
	echo "Se esperan dos argumentos"
	sleep 5
	bash menu.sh
fi


