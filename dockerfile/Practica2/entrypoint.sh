/etc/init.d/postgresql start

psql --command "CREATE USER ${USER} WITH SUPERUSER PASSWORD '${PASS}';"

createdb -O pguser ${BBDD}

/etc/init.d/postgresql stop

exec /usr/lib/postgresql/12/bin/postgres -D /var/lib/postgresql/12/main -c config_file=/etc/postgresql/12/main/postgresql.conf