
echo "Start"
PATH_TO_SERVER=/app_data/web_server.py

# cd /app_data/nginx && make install

cp /ansible/nginx.conf /etc/nginx/nginx.conf
echo "Starting nginx"
service nginx start
echo "Starting server: $PATH_TO_SERVER"
python3 $PATH_TO_SERVER

# /server/app_data/start_web_server.sh 