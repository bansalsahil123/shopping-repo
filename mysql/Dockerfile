FROM mysql:5.6

WORKDIR /var/lib/sql
COPY . .
RUN chmod 777 sqlstart.sh
RUN chmod 777 /var/lib/mysql
EXPOSE 3306
CMD ./sqlstart.sh