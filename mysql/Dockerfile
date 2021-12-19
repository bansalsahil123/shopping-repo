FROM mysql:5.7.22

WORKDIR /var/lib/sql
COPY . .
RUN chmod 777 sqlstart.sh
EXPOSE 3306
CMD ./sqlstart.sh