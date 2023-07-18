FROM ubuntu

# Correr Comandos dentro del contenedor
RUN apt-get update
RUN apt-get install -y python3
RUN echo '1.0' >> /etc/version && apt-get install -y git \
    && apt-get install -y iputils-ping

# Permite ejecutar comandos por defecto - Solo se tiene en cuenta el último
#CMD ["/bin/bash"]
RUN mkdir /datos
WORKDIR /datos
RUN touch f1.txt

RUN mkdir /datos1
WORKDIR /datos1
RUN touch f2.txt

# Copia archivos de nuestro directorio local
COPY index.html .
COPY app.log /datos 

# ADD agrega directorios locales a un directorio en el contenedor
ADD docs docs
ADD f* /datos

## ENV crea variables de entorno en docker
ENV dir=/data dir1=/data1
RUN mkdir $dir

ENV TEXTO="Esto es un ejemplo de texto"

ADD crear_dir.sh /
RUN chmod +x /crear_dir.sh

#CMD echo "$TEXTO"
CMD /crear_dir.sh

# Permite ejecutar un comando que no pueda ser reemplazado, a diferencía del CMD
#ENTRYPOINT ["/bin/bash"]
#CMD ["localhost"]