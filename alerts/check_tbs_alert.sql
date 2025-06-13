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

BEGIN
  FOR r IN c_tablespace LOOP
    -- Get total allocated size of the current tablespace
    SELECT SUM(bytes)/1048576 INTO v_total_mb
    FROM dba_data_files
    WHERE tablespace_name = r.tablespace_name;

    v_used_mb := r.used_mb;
    v_pct_used := ROUND((v_used_mb / v_total_mb) * 100, 2);

    IF v_pct_used > 90 THEN
      DBMS_OUTPUT.PUT_LINE('CRITICAL: Tablespace ' || r.tablespace_name || ' is at ' || v_pct_used || '% capacity!');
    END IF;

  END LOOP;
END;
/