# Making a new Environment

Be certain to _manually_ create the new databases,
unless it is an all-in-one.

Be certain that the new MySQL user is `IDENTIFIED WITH mysql_native_password`

```shell
sudo mysql -u root
mysql> CREATE USER 'dbuser'@'client-hostname%.library.ucla.edu' IDENTIFIED WITH mysql_native_password BY 'password';
mysql> GRANT ALL PRIVILEGES ON dbname.* TO 'dbuser'@'client-hostname%.library.ucla.edu';
mysql> FLUSH PRIVILEGES;
mysql> \q
```
