alter session set "_ORACLE_SCRIPT"=true;

drop user verduleros CASCADE;

CREATE USER verduleros IDENTIFIED BY verduleros;

GRANT CONNECT, 
      RESOURCE, 
	  CREATE VIEW
 TO verduleros;

grant create any index to verduleros;
GRANT EXECUTE any PROCEDURE TO verduleros; 

