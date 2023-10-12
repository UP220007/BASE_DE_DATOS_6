CREATE DATABASE IF NOT EXISTS Verduleros;

drop user 'verduleros'@'localhost';

CREATE USER 'verduleros'@'localhost' IDENTIFIED BY 'verduleros';

GRANT ALL PRIVILEGES ON Verduleros.* TO 'verduleros'@'localhost';

