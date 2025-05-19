-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS accounts;

-- Create 'root' user with password 'vprodbpass' (only if not already created)
-- NOTE: This is a fallback in case Docker’s MYSQL_ROOT_PASSWORD doesn’t apply
-- (but it usually does — you can skip this if you're confident it's covered)

-- GRANT privileges to root@'%' so the app container can access from anywhere
GRANT ALL PRIVILEGES ON accounts.* TO 'root'@'%' IDENTIFIED BY 'vprodbpass';

-- Reload privileges to apply changes
FLUSH PRIVILEGES;

