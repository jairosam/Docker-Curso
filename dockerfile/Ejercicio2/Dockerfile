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

## ENV crea variables de entorno en docker
ENV dir=/data dir1=/data1
RUN mkdir $dir && mkdir $dir1

#ARG dir2
#RUN mkdir $dir2
#ARG user
#ENV user_docker $user
#ADD add_user.sh /datos1
#RUN /datos1/add_user.sh

## EXPOSE - Exponer puertos del contenedor
RUN apt-get install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos1

CMD /datos1/entrypoint.sh

# Permite ejecutar un comando que no pueda ser reemplazado, a diferencía del CMD
#ENTRYPOINT ["/bin/bash"]
#CMD ["localhost"]