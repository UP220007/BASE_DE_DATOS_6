-- drop user verduleros cascade;

CREATE USER verduleros IDENTIFIED BY verduleros;

GRANT CONNECT, 
      RESOURCE, 
	  CREATE VIEW
 TO verduleros;

grant create any index to verduleros;
GRANT EXECUTE any PROCEDURE TO verduleros; 

