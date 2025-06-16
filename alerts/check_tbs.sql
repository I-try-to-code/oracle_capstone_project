SET SERVEROUTPUT ON
DECLARE
  CURSOR c_tablespace IS
    SELECT 
        tablespace_name,
        ROUND(SUM(bytes)/1048576, 2) AS used_mb
    FROM user_segments
    GROUP BY tablespace_name;

  v_total_mb NUMBER;
  v_used_mb  NUMBER;
  v_pct_used NUMBER;


END;
/