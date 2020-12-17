# covid19
Simplified Covid19 data sets and programs for analysis

There will be one file for one day. Each file will have four columns:\
**place, confirmed, deaths, recovered**

This dataset works on the datasets of
1. John Hopkins
2. covid19india.org

I cloned https://github.com/CSSEGISandData/COVID-19.git \
This created the COVID-19 directory and in this directory, every day I do a git pull.

COVID-19 dataset is a cumulative dataset, with granular data for countries like USA and China.

**gdc.py** [cgdc = corona global daily cumulative]\
The Python program **cgdc.py** takes a csv file as a command-line argument, adds up the data for each country and prints them out.\
Command I use for **cgdc.py**\
`python3 gdc.py  ../COVID-19/csse_covid_19_data/csse_covid_19_daily_reports/04-25-2020.csv > datasets/global_daily_cumulative/04-25-2020.csv`

**gdd.py** [cgdd = corona global daily delta]\
The Python program **cgdd.py** calculates the delta numbers for one day by subtracting that day's cumulative numbers with the previous day cumulative numbers.\
Command I use for **cgdd.py**\
`python3 gdd.py datasets/global_daily_cumulative/04-25-2020.csv > datasets/global_daily_delta/04-25-2020.csv`

The Indian covid-19 numbers provided by [covid19india.org](https://api.covid19india.org/states_daily.json) are incremental data, that is data for one day.

**idd.rb** [cidd = corona india daily delta]\
The Ruby program **cidd.rb** extracts the data for one day, data of which is supplied as command line argument.\
Command I use for **cidd.rb**\
`ruby cidd.rb 25-Apr-20 > datasets/india_daily_delta/04-25-2020.csv`\
*Notice the date format used by covid19india.org and used as command-line argument.*

**idc.rb** [cidc = corona india daily cumulative]\
The Ruby program **cidc.rb** calculates the cumulative data until a day by adding that day's incrementa (delta) numbers with the previous day's cumulative numbers.\
Command I used for **cidc.rb**\
`ruby cidc.rb 04-25-2020 > datasets/india_daily_cumulative/04-25-2020.csv`

--------------------------------------------------------------\
**daily_all.rb**
This Ruby program reads all the csv files in each sub-directory and
* Makes master files collating file content in each directory under datasets.
* For example, content of all files in global_daily_cumulative will be collated in global_daily_cumulative.csv
* Each line in the master file will have the data's date as the first field.
* The files made are:
    * global_daily_cumulative.csv
    * global_daily_delta.csv
    * india_daily_cumulative.csv
    * india_daily_delta.csv

Format of each file is:\
**date, place, confirmed, deaths, recovered**

--------------------------------------------------------------\
This application is hosted at 172.105.49.105/cdb


--------------------------------------------------------------\
Quick Steps
-- clone this repository
-- Create database, tables and insert data from daily_all.rb into your database. PostgreSQL steps [here](https://github.com/mh-github/covid19/blob/master/database/postgres/postgresql-commands.sql)
-- $ cd rails/dashboard
-- $ yarn install 
-- $ rails server
