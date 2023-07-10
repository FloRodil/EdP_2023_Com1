# TP Entorno de Programación - 2023
### Comisión 1
#### Integrantes: 
#### Rodil, Florencia - R-4680/9
#### Sorbellini, Jorge - S-5790/8
#### Urtubey, Maximiliano - U-0553/3

## GADI
GADI (Generador Aleatorio De Imágenes) es un programa que permite al usuario
descargar un conjunto de imágenes de manera aleatoria de un servicio web (por
lo que se necesita de una conexión a internet), selecciona las imágenes de
personas y las procesa para darles un formato de 512x512 px para luego formar
un paquete comprimido de las imágenes previamente procesadas, en formato .tar,
que incluye información de todos los archivos.

### Creación de la imagen de Docker y ejecución del script:
1. Descargar el archivo ´Dockerfile'
2. Ejecutar el siguiente comando: 'docker build -t gadi .'
3. Correr el siguiente script: 'bash runGADI.sh'

### Modo de Uso
![alt text](https://iili.io/HsXt6VR.jpg)
En la terminal se muestra un menú -que si es la primera vez que se ejecuta-
el script descargará automáticamente los archivos y creará las carpetas
'dataset' y 'descargas', necesarios para el procesamiento. Una vez terminadas
las comprobaciones se muestra el MENÚ principal el que sólo visualizará la
opción de generar imágenes o de terminar el programa. Para generar las
imágenes se debe ingresar por teclado un número para indicar la cantidad de
archivos a descargar. Para terminar con la ejecución del programa y regresar
a la terminal, se debe ingresar la letra 'X'.
En caso de que el programa se hubiese ejecutado previamente y exitan archivos
para descomprimir se mostrará el MENÚ completo con todas las opciones
disponibles.


### Uso del MENÚ principal
### Generar imágenes
Una vez ejecutado el script se mostrará la opción de '1-Generar imágenes',
para acceder a ella se debe ingresar por teclado, luego de 'Tu opción: ', el
número '1'. A continuación se mostrará otro menú donde se debe ingresar la
cantidad de imágenes a generar o ingresar '0' para regresar al MENÚ principal.
Luego de ingresada la cantidad el programa crea un archivo comprimido (.tar)
dentro de la carpeta '/app/dataset/descargas' junto con un archivo con el
número de la suma de verificación del .tar. Los nombres de ambos archivos
tienen el formato día y mes seguidos por la hora de su creación
('ddmm-hhmmss.tar' y 'ddmm-hhmmss.txt').


### Descomprimir archivo
Al seleccionar la opción '2-Descomprimir archivo', ingresando por teclado el
número '2', aparecerá un listado de 'Archivos disponibles'. A continuación
se deben ingresar los nombres completos de dos de los archivos listados, ambos
separados por un espacio en blanco. El primero debe hacer referencia al archivo
comprimido con su extensión .tar y el segundo al archivo de texto que contiene
la suma de verificación, también con su extension .txt, o ingresar '0' para
regresar al MENÚ principal.


### Procesar
Al seleccionar la opción '3-Procesar', ingresando por teclado el número '3',
se recortarán a 512x512 px todas las imágenes resultantes de la descompresión
cuyo nombre de archivo sea un nombre de persona válido, esto es, una palabra
que empiece con una letra mayúscula seguida de letras minúsculas. Luego de
procesar las imágenes, el contenido de la carpeta 'descomprimidos' es borrado
para evitar que futuros procesamientos incluyan imágenes ya procesadas. 
Si Procesar no genera resultados es debido a que ninguna de las imágenes
proporcionadas tiene como nombre un nombre de persona.

### Comprimir
Al seleccionar la opción '4-Comprimir', ingresando por teclado el número '4',
se generará un archivo comprimido conteniendo todas las imágenes procesadas y
tres archivos que contendrán, respectivamente, una lista con el nombre de
todas las imágenes generadas, una lista de nombres válidos y una lista con
los nombres válidos finalizados con la letra 'a' y la cantidad total de los
mismos. El archivo comprimido, resultante del script, tendrá como nombre la
fecha y hora de su creación y estará disponible en /GADI/comprimidos. Si
Comprimir muestra el error 'Tiene ... antes de comprimir' es porque es
necesario que el paso previo sea un procesamiento de imágenes válidas.
