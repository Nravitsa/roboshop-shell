dnf module disable nodejs -y
dnf module enable nodejs:20 -y

dnf install nodejs -y

useradd roboshop
cp catalogue.service /etc/systemd/system/catalogue.service
cp Catalogue_mongo_schema.repo /etc/yum.repos.d/mongo.repo
mkdir /app

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cd /app
unzip /tmp/catalogue.zip

cd /app
npm install

systemctl daemon-reload # change in service files
systemctl enable catalogue
systemctl start catalogue

cp Catalogue_mongo_schema.repo /etc/yum.repos.d/mongo.repo

dnf install mongodb-mongosh -y

mongosh --host mongodb-dev.tusharbytes.com </app/db/master-data.js