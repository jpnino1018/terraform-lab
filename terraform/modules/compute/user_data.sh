#!/bin/bash
dnf update -y
dnf install -y nginx

systemctl enable nginx
systemctl start nginx

cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
  <head>
    <title>IaC Workshop</title>
  </head>
  <body>
    <h1>Hi, I am ${student_name} and this is my IaC</h1>
  </body>
</html>
EOF