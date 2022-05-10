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

# bulk copy commands for the four tables
set PGPASSWORD=postgres&& "C:\Program Files\PostgreSQL\13\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy global_daily_cumulative(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\global_daily_cumulative.csv' DELIMITER ',' CSV;"

set PGPASSWORD=postgres&& "C:\Program Files\PostgreSQL\13\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy global_daily_delta(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\global_daily_delta.csv' DELIMITER ',' CSV;"

set PGPASSWORD=postgres&& "C:\Program Files\PostgreSQL\13\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy india_daily_cumulative(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\india_daily_cumulative.csv' DELIMITER ',' CSV;"

set PGPASSWORD=postgres&& "C:\Program Files\PostgreSQL\13\bin\psql.exe" -h localhost -U postgres -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy india_daily_delta(date, place, confirmed, deaths, recovered) FROM 'E:\Code\Corona2020\covid19\india_daily_delta.csv' DELIMITER ',' CSV;"


# bulk copy commands for the four tables - Linux
# https://stackoverflow.com/questions/46736894/how-to-allow-postgres-login-without-password-prompt-on-local-connection
    # When you specify -h 127.0.0.1 that is not a "local" connection - it's a host (=TCP based) connection. So a line starting with local will not match for such a connection.

    # To make that entry work, do not specify a hostname or port for psql, then it will use a "local" connection through named pipes.

    # Alternatively, you can local with host and then add 127.0.0.1 as the (client) IP address to "trust".
$ pg_ctlcluster 13 main start
$ su postgres
$ psql
\c covid19

# list tables
\dt

select count(*) from global_daily_cumulative;
select count(*) from global_daily_delta;
select count(*) from india_daily_cumulative;
select count(*) from india_daily_delta;

delete from global_daily_cumulative;
delete from global_daily_delta;
delete from india_daily_cumulative;
delete from india_daily_delta;

select * from global_daily_cumulative;
select * from global_daily_delta;
select * from india_daily_cumulative;
select * from india_daily_delta;

covid19=# exit
postgres@localhost:~$ psql -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy global_daily_cumulative(date, place, confirmed, deaths, recovered) FROM '/var/www/datasets/covid19/global_daily_cumulative.csv' DELIMITER ',' CSV;"

postgres@localhost:~$ psql -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy global_daily_delta(date, place, confirmed, deaths, recovered) FROM '/var/www/datasets/covid19/global_daily_delta.csv' DELIMITER ',' CSV;"

postgres@localhost:~$ psql -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy india_daily_cumulative(date, place, confirmed, deaths, recovered) FROM '/var/www/datasets/covid19/india_daily_cumulative.csv' DELIMITER ',' CSV;"

postgres@localhost:~$ psql -d covid19 -c "SET client_encoding TO 'UTF8';" -c "\copy india_daily_delta(date, place, confirmed, deaths, recovered) FROM '/var/www/datasets/covid19/india_daily_delta.csv' DELIMITER ',' CSV;"
=====================================================================
21-Apr-2022
New create table scripts with id, created_at, updated_at

CREATE TABLE public.global_daily_cumulative (
	id bigserial NOT NULL,
	"date" timestamp(6) NULL,
	place varchar NULL,
	confirmed int4 NULL,
	deaths int4 NULL,
	recovered int4 NULL,
	created_at timestamp(6) NOT NULL,
	updated_at timestamp(6) NOT NULL,
	CONSTRAINT global_daily_cumulative_pkey PRIMARY KEY (id)
);

CREATE TABLE public.global_daily_delta (
	id bigserial NOT NULL,
	"date" timestamp(6) NULL,
	place varchar NULL,
	confirmed int4 NULL,
	deaths int4 NULL,
	recovered int4 NULL,
	created_at timestamp(6) NOT NULL,
	updated_at timestamp(6) NOT NULL,
	CONSTRAINT global_daily_delta_pkey PRIMARY KEY (id)
);

CREATE TABLE public.india_daily_cumulative (
	id bigserial NOT NULL,
	"date" timestamp(6) NULL,
	place varchar NULL,
	confirmed int4 NULL,
	deaths int4 NULL,
	recovered int4 NULL,
	created_at timestamp(6) NOT NULL,
	updated_at timestamp(6) NOT NULL,
	CONSTRAINT india_daily_cumulative_pkey PRIMARY KEY (id)
);

CREATE TABLE public.india_daily_delta (
	id bigserial NOT NULL,
	"date" timestamp(6) NULL,
	place varchar NULL,
	confirmed int4 NULL,
	deaths int4 NULL,
	recovered int4 NULL,
	created_at timestamp(6) NOT NULL,
	updated_at timestamp(6) NOT NULL,
	CONSTRAINT india_daily_delta_pkey PRIMARY KEY (id)
);
