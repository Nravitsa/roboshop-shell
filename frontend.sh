
#Disable nginx all, enable version 24, installing
dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y

cp nginx.conf /etc/nginx/nginx.conf

systemctl enable nginx
systemctl start nginx

rm -rf /usr/share/nginx/html/* #removing defAULT HTML CONTENT from NginX
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip # using -o means you are telling yoiur linux to save this file  to this specific name and this directory
cd /usr/share/nginx/html  # you'd like to change dir first to unzip the file
unzip /tmp/frontend.zip

systemctl restart nginx