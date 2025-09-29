component_name=catalogue
source common.sh

pwd=$(pwd)

cp ${pwd}/mongo.repo /etc/yum.repos.d/mongo.repo

nodejs


dnf install mongodb-mongosh -y

mongosh --host mongodb-dev.tusharbytes.com </app/db/master-data.js

systemd_setup