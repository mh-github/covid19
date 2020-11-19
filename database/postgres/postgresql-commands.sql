CREATE DATABASE covid19;

CREATE TABLE global_daily_cumulative
(
    date timestamp without time zone,
    place character varying(255) COLLATE pg_catalog."default",
    confirmed bigint, 
    deaths bigint,
    recovered bigint
);

CREATE TABLE global_daily_delta
(
    date timestamp without time zone,
    place character varying(255) COLLATE pg_catalog."default",
    confirmed bigint, 
    deaths bigint,
    recovered bigint
);

CREATE TABLE india_daily_cumulative
(
    date timestamp without time zone,
    place character varying(255) COLLATE pg_catalog."default",
    confirmed bigint, 
    deaths bigint,
    recovered bigint
);

CREATE TABLE india_daily_delta
(
    date timestamp without time zone,
    place character varying(255) COLLATE pg_catalog."default",
    confirmed bigint, 
    deaths bigint,
    recovered bigint
);

ALTER DATABASE covid19 SET datestyle TO "ISO, MDY";
# Restart the server after this command


# psql commands
# connect to database
\c covid19

# list tables
\dt

delete from global_daily_cumulative;
delete from global_daily_delta;
delete from india_daily_cumulative;
delete from india_daily_delta;


# bulk copy commands for the four tables
"C:\Program Files\PostgreSQL\13\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy global_daily_cumulative(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\global_daily_cumulative.csv' DELIMITER ',' CSV;"

"C:\Program Files\PostgreSQL\13\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy global_daily_delta(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\global_daily_delta.csv' DELIMITER ',' CSV;"

"C:\Program Files\PostgreSQL\13\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy india_daily_cumulative(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\india_daily_cumulative.csv' DELIMITER ',' CSV;"

"C:\Program Files\PostgreSQL\13\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy india_daily_delta(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\india_daily_delta.csv' DELIMITER ',' CSV;"


# bulk copy commands for the four tables - Linux
# https://stackoverflow.com/questions/46736894/how-to-allow-postgres-login-without-password-prompt-on-local-connection
    # When you specify -h 127.0.0.1 that is not a "local" connection - it's a host (=TCP based) connection. So a line starting with local will not match for such a connection.

    # To make that entry work, do not specify a hostname or port for psql, then it will use a "local" connection through named pipes.

    # Alternatively, you can local with host and then add 127.0.0.1 as the (client) IP address to "trust".

$ su postgres
psql -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy global_daily_cumulative(date, place, confirmed, deaths, recovered) FROM '/var/www/covid19/global_daily_cumulative.csv' DELIMITER ',' CSV;"

psql -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy global_daily_delta(date, place, confirmed, deaths, recovered) FROM '/var/www/covid19/global_daily_delta.csv' DELIMITER ',' CSV;"

psql -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy india_daily_cumulative(date, place, confirmed, deaths, recovered) FROM '/var/www/covid19/india_daily_cumulative.csv' DELIMITER ',' CSV;"

psql -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy india_daily_delta(date, place, confirmed, deaths, recovered) FROM '/var/www/covid19/india_daily_delta.csv' DELIMITER ',' CSV;"

select count(*) from global_daily_cumulative;
select count(*) from global_daily_delta;
select count(*) from india_daily_cumulative;
select count(*) from india_daily_delta;

select * from global_daily_cumulative;
select * from global_daily_delta;
select * from india_daily_cumulative;
select * from india_daily_delta;