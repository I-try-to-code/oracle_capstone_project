

-- Print message based on usage
SELECT 
    'Tablespace ' || tablespace_name || ' usage: ' || 
    ROUND(SUM(bytes)/1048576, 2) || ' MB out of ' ||
    (SELECT ROUND(SUM(bytes)/1048576, 2) FROM dba_data_files WHERE tablespace_name = a.tablespace_name) || ' MB used.'
    AS usage_report
FROM user_segments a
GROUP BY tablespace_name;

-- Add warning if over 80%
SELECT 
    '⚠️ WARNING: High usage in ' || tablespace_name || '! Consider cleanup or request increase.' AS alert
FROM user_segments
GROUP BY tablespace_name
HAVING ROUND(SUM(bytes)/1048576, 2) > (
    SELECT ROUND(SUM(bytes)/1048576 * 0.8, 2)
    FROM dba_data_files
    WHERE tablespace_name = (SELECT default_tablespace FROM dba_users WHERE username = USER)
);

SPOOL OFF