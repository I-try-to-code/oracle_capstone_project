SET ECHO OFF  
SET FEEDBACK OFF
SET VERIFY OFF
SET PAGESIZE 100
SET LINESIZE 150
COLUMN tablespace_name FORMAT A20

SPOOL C:\oracle_capstone_project\logs\own_tablespace_usage.log

-- Show who is running the script
SELECT 'User: ' || USER AS user_info FROM dual;

-- Get current user's tablespace usage
SELECT 
    tablespace_name,
    ROUND(SUM(bytes)/1048576, 2) AS used_mb
FROM user_segments
GROUP BY tablespace_name;

-- Show warning if tablespace is known and large
SELECT 
    ' Warning: Consider cleanup or request more space.' AS message
FROM dual
WHERE EXISTS (
    SELECT 1
    FROM user_segments
    GROUP BY tablespace_name
    HAVING SUM(bytes) > 40 * 1048576  -- Assume 40MB threshold
);

SPOOL OFF