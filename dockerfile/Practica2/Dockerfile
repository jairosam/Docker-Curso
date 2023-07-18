FROM ubuntu

LABEL Creador="Jairo Buitrago"

RUN apt-get update

RUN apt-get install -y wget

RUN apt-get install -y lsb-release

RUN apt-get install -y gnupg2

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata

RUN echo "deb http://apt.postgresql.org/pub/repos/apt \
        $(lsb_release -cs)-pgdg main" > \
        /etc/apt/sources.list.d/pgdg.list

RUN wget --quiet -O - \
        https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update

RUN apt-get -y install postgresql-12

RUN echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/12/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/12/main/postgresql.conf

EXPOSE 5432

RUN mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql

VOLUME ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

ADD entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/entrypoint.sh

USER postgres

ENV PASS=secret
ENV BBDD=pgdb
ENV USER=pguser

CMD /usr/local/bin/entrypoint.sh

