FROM python:3.8 
WORKDIR /Ecommerce_django
RUN apt-get update

RUN apt-get -y install ufw
RUN apt-get -y install nginx
RUN apt-get install -y vim
RUN ufw allow 'Nginx HTTP'
RUN service nginx restart

COPY req.txt .
RUN pip3 install -r req.txt

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY . .
EXPOSE 9001 
CMD ./RunEcommerce.sh


