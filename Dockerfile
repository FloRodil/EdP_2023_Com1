FROM alpine

RUN apk update && apk add bash imagemagick

WORKDIR /app

ADD README.md .

ADD menu.sh /app/scripts/

ADD generar.sh /app/scripts/

ADD descomprimir.sh /app/scripts/

ADD procesar.sh /app/scripts/

ADD comprimir.sh /app/scripts/

ENTRYPOINT ["bash","/app/scripts/menu.sh"]
