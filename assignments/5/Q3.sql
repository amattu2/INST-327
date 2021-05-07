---Assignment 5, Q3
---Managing Users
SET GLOBAL default_password_lifetime = 60;


CREATE USER IF NOT EXISTS falcon@localhost IDENTIFIED BY 'cap';
CREATE USER IF NOT EXISTS bucky_barnes@localhost IDENTIFIED BY 'longing_rusted_seventeen';
CREATE USER IF NOT EXISTS john_walker@localhost IDENTIFIED BY 'battlestar';
CREATE USER IF NOT EXISTS flag_smasher@localhost IDENTIFIED BY 'Karli';


GRANT INSERT, SELECT, DELETE ON ex.* TO falcon@localhost;
GRANT INSERT, SELECT, DELETE ON ex.* TO bucky_barnes@localhost;
GRANT INSERT, SELECT, DELETE ON ex.* TO john_walker@localhost;
GRANT INSERT, SELECT, DELETE ON ex.* TO flag_smasher@localhost;


RENAME USER falcon@localhost to captin_america@localhost;


ALTER USER captin_america IDENTIFIED BY "redwing";


DROP USER john_walker@localhost;