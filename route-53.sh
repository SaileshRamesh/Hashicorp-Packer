sleep 30,
sudo apt update,
sudo apt install nginx -y,
sudo apt install -y python3,
sudo apt udpate && sudo apt install certbot python3-certbot-nginx,
sudo mkdir -p /var/www/saileshramesh.xyz/html,
sudo chown -R $USER:$USER /var/www/saileshramesh.xyz/html,
sudo chmod -R 755 /var/www/saileshramesh.xyz,
vim /var/www/saileshramesh.xyz/html/index.html,
<html>
    <head>
<title> Welcome to saileshramesh.xyz!<title>
    <head>
    <body>
<h1>Sucess! The saileshramesh.xyz server block is working!<h1>
    </body>
</html>

sudo vim /etc/nginx/sites-available/saileshramesh.xyz
server {
    listen 80;
    listen [::]:80;

    root /var/www/saileshramesh.xyz/html;
    index index.html index.htm index.nginx-debian.html;

    server_name saileshramesh.xyz failover.saileshramesh.xyz latency.saileshramesh.xyz weighted.saileshramesh.xyz geolocation.saileshramesh.xyz
    location / {
    try_files furi Suri/ =404;
    }
}
 
sudo ln -s /etc/nginx/sites-available/sailesh.ramesh.xyz /etc/nginx/sites-enabled/ sudo nginx -t
sudo systemctl restart nginx
sudo certbot certonly \
--agree-tos \
--email pinapathruni.saikiran@gmail.com \
--manual \
--preferred-challenges=dns \
-d *. saileshramesh.xyz
--server https: //acme-v02.api.letsencrypt.org/directory


If we need to get individual ssl certs we can perform following:
certbot --nginx
+++++++++++++++++++++++++++++++++++++++++++++++++

while true; do curl -sL https://latency.saileshramesh.xyz | grep -i '\-server'; sleep 1; echo "The Count value is $I"; sleep 1; I=$ ( ( $1 + 1 )); done