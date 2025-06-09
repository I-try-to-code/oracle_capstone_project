-- Create custom profile
CREATE PROFILE department_profile LIMIT
PASSWORD_LIFE_TIME 60
FAILED_LOGIN_ATTEMPTS 5
SESSIONS_PER_USER 3
CPU_PER_SESSION UNLIMITED;

-- Assign to users
ALTER USER hr_user PROFILE department_profile;
ALTER USER finance_user PROFILE department_profile;
ALTER USER sales_user PROFILE department_profile;