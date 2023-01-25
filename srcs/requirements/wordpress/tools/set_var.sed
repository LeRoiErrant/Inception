#!/bin/sed -f
s/username_here/$(TEST_SED)/g
s/password_here/$WORDPRESS_DB_PASSWORD/g
s/localhost/$WORDPRESS_DB_HOST/g
s/database_name_here/$WORDPRESS_DB_DATABASE/g