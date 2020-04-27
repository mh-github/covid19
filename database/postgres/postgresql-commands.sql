CREATE TABLE global_daily_cumulative
(
    date timestamp without time zone,
    place character varying(255) COLLATE pg_catalog."default",
    confirmed bigint, 
    deaths bigint,
    recovered bigint
)

CREATE TABLE global_daily_delta
(
    date timestamp without time zone,
    place character varying(255) COLLATE pg_catalog."default",
    confirmed bigint, 
    deaths bigint,
    recovered bigint
)

CREATE TABLE india_daily_cumulative
(
    date timestamp without time zone,
    place character varying(255) COLLATE pg_catalog."default",
    confirmed bigint, 
    deaths bigint,
    recovered bigint
)

CREATE TABLE india_daily_delta
(
    date timestamp without time zone,
    place character varying(255) COLLATE pg_catalog."default",
    confirmed bigint, 
    deaths bigint,
    recovered bigint
)
ALTER DATABASE covid19 SET datestyle TO "ISO, MDY";
# Restart the server after this command

# bulk copy commands for the four tables
"C:\Program Files\PostgreSQL\12\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy global_daily_cumulative(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\global_daily_cumulative.csv' DELIMITER ',' CSV;"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy global_daily_delta(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\global_daily_delta.csv' DELIMITER ',' CSV;"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy india_daily_cumulative(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\india_daily_cumulative.csv' DELIMITER ',' CSV;"

"C:\Program Files\PostgreSQL\12\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy india_daily_delta(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\india_daily_delta.csv' DELIMITER ',' CSV;"
