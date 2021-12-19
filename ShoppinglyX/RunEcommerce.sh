service nginx restart
service nginx status


python3 manage.py createsuperuser --noinput

cd /Ecommerce_django;

gunicorn shoppinglyx.wsgi:application --name shoppinglyx --workers 8 --timeout 120 --bind=unix:run/shoppinglyx.sock