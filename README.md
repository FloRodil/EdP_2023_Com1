# TP EdP 2023

## GADI

GADI (Generador Aleatorio De Imágenes) es un programa que permite al usuario 
descargar un conjunto de imágenes de manera aleatoria de un servicio web (por
lo que se necesita de una conexión a internet), selecciona las imágenes de
personas y las procesa para darles un formato de 512x512 px para luego formar
un paquete comprimido de las imágenes previamente procesadas en formato .tar
que son acompañados con archivos de texto que enumeran los nombres de los
archivos.

### Modo de Uso
#### Ejecución del Script
El script se ejecuta corriendo el siguiente comando: docker run ...

En la terminal se muestra un menú -que si es la primera vez que se ejecuta-
el script descargará automáticamente los archivos necesarios y creará la carpeta
./dataset (en el disco local) necesarios para el procesamiento. Una vez terminadas
las comprobaciones se muestra el MENÚ principal el que sólo mostrará la opción de
generar imágenes ó de terminar el programa.
Para generar las imágenes se debe ingresar por teclado un número para indicar la
cantidad de archivos a descargar. Para terminar con la ejecución del programa y
regresar a la terminal, se debe ingresar la letra 'X'.

En caso de que el programa se hubiese ejecutado previamente y exitan archivos
para descomprimir se mostrará el MENÚ completo con todas las opciones disponibles.

**img**

#### Uso del MENÚ principal
##### Generar imágenes
Una vez ejecutado el script se verá la opción de '1-Generar imágenes', para ello se
debe ingresar por teclado luego de 'Tu opción: 'el número '1'.
A continuación se mostrará otro menú donde se debe ingresar la cantidad de imágenes a
generar ó ingresar '0' para regresar al MENÚ principal.
Luego de ingresada la cantidad el programa crea un archivo comprimido (.tar) dentro
de la carpeta './dataset/descargas' junto con  un archivo con el número de la suma de
verificación del archivo comprimido.

**img**

##### Descomprimir archivo
Para descomprimir se deben ingresar los nombres completos de dos de los archivos
listados dentro de 'Archivos disponibles: ' ambos separados por un espacio en blanco
el primero debe hacer referencia al archivo comprimido con su extensión .tar y el
segundo al archivo de texto que contiene la suma de verificación, también con su
extension .txt, ó ingresar '0' para regresar al MENÚ principal.

**img**

##### Procesar

**img**

##### Comprimir

**img**



