service nginx restart
service nginx status

sleep 30
python3 manage.py createsuperuser --noinput

cd /Ecommerce_django;
gunicorn shoppinglyx.wsgi:application --name shoppinglyx --workers 8 --timeout 120 --bind=unix:/Ecommerce_django/run/shoppinglyx.sock