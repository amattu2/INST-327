---Assignment 5, Q2
---System Variables
SET SQL_SAFE_UPDATES = 0;
SET GLOBAL max_connections = 60;
SET autocommit = 0;
SET autocommit = 1;
SET GLOBAL long_query_time = 10;
SET max_sp_recursion_depth = 300;
SET cte_max_recursion_depth = 300;


SHOW VARIABLES LIKE "SQL_SAFE_UPDATES";
SHOW VARIABLES LIKE "max_connections";
SHOW VARIABLES LIKE "autocommit";
SHOW VARIABLES LIKE "long_query_time";
SHOW VARIABLES LIKE "max_sp_recursion_depth";
SHOW VARIABLES LIKE "cte_max_recursion_depth";


SHOW VARIABLES;