# covid19
Simplified Covid19 data sets and programs for analysis

There will be one file for one day. Each file will have four columns:\
**place, confirmed, deaths, recovered**

This dataset works on the John Hopkins and covid19india.org datasets.

I cloned https://github.com/CSSEGISandData/COVID-19.git \
This created the COVID-19 directory and in this directory, every day I do a git pull.

COVID-19 dataset is a cumulative dataset, with granular data for countries like USA and China.

**cgdc.py** [cgdc = corona global daily cumulative]\
The Python program **cgdc.py** takes a csv file as a command-line argument, adds up the data for each country and prints them out.\
Command I use for **cgdc.py**\
`python3 cgdc.py  ../COVID-19/csse_covid_19_data/csse_covid_19_daily_reports/04-25-2020.csv > datasets/global_daily_cumulative/04-25-2020.csv`

**cgdd.py** [cgdd = corona global daily delta]\
The Python program **cgdd.py** calculates the delta numbers for one day by subtracting that day's cumulative numbers with the previous day cumulative numbers.\
Command I use for **cgdd.py**\
`python3 cgdd.py datasets/global_daily_cumulative/04-25-2020.csv > datasets/global_daily_delta/04-25-2020.csv`

The Indian covid-19 numbers provided by [covid19india.org](https://api.covid19india.org/states_daily.json) are incremental data, that is data for one day.

**cidd.rb** [cidd = corona india daily delta]\
The Ruby program **cidd.rb** extracts the data for one day, data of which is supplied as command line argument.\
Command I use for **cidd.rb**\
`ruby cidd.rb 25-Apr-20 > datasets/india_daily_delta/04-25-2020.csv`\
*Notice the date format used by covid19india.org and used as command-line argument.*

**cidc.rb** [cidc = corona india daily cumulative]\
The Ruby program **cidc.rb** calculates the cumulative data until a day by adding that day's incrementa (delta) numbers with the previous day's cumulative numbers.\
Command I used for **cidc.rb**\
`ruby cidc.rb 04-25-2020 > datasets/india_daily_cumulative/04-25-2020.csv`