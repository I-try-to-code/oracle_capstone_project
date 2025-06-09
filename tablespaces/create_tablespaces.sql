-- HR Tablespace
CREATE TABLESPACE hr_data
DATAFILE 'C:/oraclexe/oradata/CAPSTON/hr_data.dbf'
SIZE 50M
AUTOEXTEND ON NEXT 10M MAXSIZE 200M;

-- Finance Tablespace
CREATE TABLESPACE finance_data
DATAFILE 'C:/oraclexe/oradata/CAPSTON/finance_data.dbf'
SIZE 50M
AUTOEXTEND ON NEXT 10M MAXSIZE 200M;
--sales
CREATE TABLESPACE sales_data
DATAFILE 'C:/oraclexe/oradata/CAPSTON/sales_data.dbf'
SIZE 50M
AUTOEXTEND ON NEXT 10M MAXSIZE 200M;