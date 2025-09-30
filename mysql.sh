if [ -z "$1" ]; then
  echo Password is missing
  exit
fi


dnf install mysql-server -y
systemctl enable mysqld
systemctl start mysqld

mysql_secure_installation --set-root-pass $1 #RoboShop@1