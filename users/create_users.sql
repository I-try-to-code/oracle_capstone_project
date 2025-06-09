-- HR User for accessing HR dAta
CREATE USER hr_user IDENTIFIED BY hrpass
DEFAULT TABLESPACE hr_data
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON hr_data;
GRANT CONNECT, RESOURCE TO hr_user;

-- Finance User for accessing Finance Data
DEFAULT TABLESPACE finance_data
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON finance_data;
GRANT CONNECT, RESOURCE TO finance_user;

-- Sales User for accessing Sales Data
CREATE USER sales_user IDENTIFIED BY salespass
DEFAULT TABLESPACE sales_data
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON sales_data;
GRANT CONNECT, RESOURCE TO sales_user;