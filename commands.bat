python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-13-2021.csv > datasets\global_daily_cumulative\05-13-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-14-2021.csv > datasets\global_daily_cumulative\05-14-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-15-2021.csv > datasets\global_daily_cumulative\05-15-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-16-2021.csv > datasets\global_daily_cumulative\05-16-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-17-2021.csv > datasets\global_daily_cumulative\05-17-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-18-2021.csv > datasets\global_daily_cumulative\05-18-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-19-2021.csv > datasets\global_daily_cumulative\05-19-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-20-2021.csv > datasets\global_daily_cumulative\05-20-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-21-2021.csv > datasets\global_daily_cumulative\05-21-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-22-2021.csv > datasets\global_daily_cumulative\05-22-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-23-2021.csv > datasets\global_daily_cumulative\05-23-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-24-2021.csv > datasets\global_daily_cumulative\05-24-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-25-2021.csv > datasets\global_daily_cumulative\05-25-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-26-2021.csv > datasets\global_daily_cumulative\05-26-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-27-2021.csv > datasets\global_daily_cumulative\05-27-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-28-2021.csv > datasets\global_daily_cumulative\05-28-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-29-2021.csv > datasets\global_daily_cumulative\05-29-2021.csv
python3 gdc.py ..\COVID-19\csse_covid_19_data\csse_covid_19_daily_reports\05-30-2021.csv > datasets\global_daily_cumulative\05-30-2021.csv


REM -------------------------------------
python3 gdd.py datasets\global_daily_cumulative\05-13-2021.csv > datasets\global_daily_delta\05-13-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-14-2021.csv > datasets\global_daily_delta\05-14-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-15-2021.csv > datasets\global_daily_delta\05-15-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-16-2021.csv > datasets\global_daily_delta\05-16-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-17-2021.csv > datasets\global_daily_delta\05-17-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-18-2021.csv > datasets\global_daily_delta\05-18-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-19-2021.csv > datasets\global_daily_delta\05-19-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-20-2021.csv > datasets\global_daily_delta\05-20-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-21-2021.csv > datasets\global_daily_delta\05-21-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-22-2021.csv > datasets\global_daily_delta\05-22-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-23-2021.csv > datasets\global_daily_delta\05-23-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-24-2021.csv > datasets\global_daily_delta\05-24-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-25-2021.csv > datasets\global_daily_delta\05-25-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-26-2021.csv > datasets\global_daily_delta\05-26-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-27-2021.csv > datasets\global_daily_delta\05-27-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-28-2021.csv > datasets\global_daily_delta\05-28-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-29-2021.csv > datasets\global_daily_delta\05-29-2021.csv
python3 gdd.py datasets\global_daily_cumulative\05-30-2021.csv > datasets\global_daily_delta\05-30-2021.csv

REM -------------------------------------
ruby idd.rb 13-May-21 > datasets\india_daily_delta\05-13-2021.csv
ruby idd.rb 14-May-21 > datasets\india_daily_delta\05-14-2021.csv
ruby idd.rb 15-May-21 > datasets\india_daily_delta\05-15-2021.csv
ruby idd.rb 16-May-21 > datasets\india_daily_delta\05-16-2021.csv
ruby idd.rb 17-May-21 > datasets\india_daily_delta\05-17-2021.csv
ruby idd.rb 18-May-21 > datasets\india_daily_delta\05-18-2021.csv
ruby idd.rb 19-May-21 > datasets\india_daily_delta\05-19-2021.csv
ruby idd.rb 20-May-21 > datasets\india_daily_delta\05-20-2021.csv
ruby idd.rb 21-May-21 > datasets\india_daily_delta\05-21-2021.csv
ruby idd.rb 22-May-21 > datasets\india_daily_delta\05-22-2021.csv
ruby idd.rb 23-May-21 > datasets\india_daily_delta\05-23-2021.csv
ruby idd.rb 24-May-21 > datasets\india_daily_delta\05-24-2021.csv
ruby idd.rb 25-May-21 > datasets\india_daily_delta\05-25-2021.csv
ruby idd.rb 26-May-21 > datasets\india_daily_delta\05-26-2021.csv
ruby idd.rb 27-May-21 > datasets\india_daily_delta\05-27-2021.csv
ruby idd.rb 28-May-21 > datasets\india_daily_delta\05-28-2021.csv
ruby idd.rb 29-May-21 > datasets\india_daily_delta\05-29-2021.csv
ruby idd.rb 30-May-21 > datasets\india_daily_delta\05-30-2021.csv

REM -------------------------------------
ruby idc.rb 05-13-2021 > datasets\india_daily_cumulative\05-13-2021.csv
ruby idc.rb 05-14-2021 > datasets\india_daily_cumulative\05-14-2021.csv
ruby idc.rb 05-15-2021 > datasets\india_daily_cumulative\05-15-2021.csv
ruby idc.rb 05-16-2021 > datasets\india_daily_cumulative\05-16-2021.csv
ruby idc.rb 05-17-2021 > datasets\india_daily_cumulative\05-17-2021.csv
ruby idc.rb 05-18-2021 > datasets\india_daily_cumulative\05-18-2021.csv
ruby idc.rb 05-19-2021 > datasets\india_daily_cumulative\05-19-2021.csv
ruby idc.rb 05-20-2021 > datasets\india_daily_cumulative\05-20-2021.csv
ruby idc.rb 05-21-2021 > datasets\india_daily_cumulative\05-21-2021.csv
ruby idc.rb 05-22-2021 > datasets\india_daily_cumulative\05-22-2021.csv
ruby idc.rb 05-23-2021 > datasets\india_daily_cumulative\05-23-2021.csv
ruby idc.rb 05-24-2021 > datasets\india_daily_cumulative\05-24-2021.csv
ruby idc.rb 05-25-2021 > datasets\india_daily_cumulative\05-25-2021.csv
ruby idc.rb 05-26-2021 > datasets\india_daily_cumulative\05-26-2021.csv
ruby idc.rb 05-27-2021 > datasets\india_daily_cumulative\05-27-2021.csv
ruby idc.rb 05-28-2021 > datasets\india_daily_cumulative\05-28-2021.csv
ruby idc.rb 05-29-2021 > datasets\india_daily_cumulative\05-29-2021.csv
ruby idc.rb 05-30-2021 > datasets\india_daily_cumulative\05-30-2021.csv