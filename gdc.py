import os, sys, csv
from datetime import datetime

indexes_to_read = {
    'format1': [1,3,4,5],
    'format2': [3,7,8,9]
}

country_data_file = {}
file_path         = sys.argv[1]
file_name         = os.path.basename(file_path)

# if file_name is before 03-22-2020, file_format = format1 else format2
date_str = file_name.split('.')[0]
file_date = datetime.strptime(date_str, "%m-%d-%Y").date()
date2 = datetime.strptime("03-22-2020", "%m-%d-%Y").date()

if file_date < date2:
    file_format = 'format1'
else:
    file_format = 'format2'

country_index     = indexes_to_read[file_format][0]
confirmed_index   = indexes_to_read[file_format][1]
deaths_index      = indexes_to_read[file_format][2]
recovered_index   = indexes_to_read[file_format][3]


with open(sys.argv[1]) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    next(csv_reader)
    for row in csv_reader:
        country = row[country_index]
        if country == "Mainland China":
            country = "China"
        if country == "Korea, South":
            country = "South Korea"
        if country == "Gambia, The":
            country = "Gambia"
        if country == "Bahamas, The":
            country = "Bahamas"
        if country == "The Bahamas":
            country = "Bahamas"
        if country == "Gambia, The":
            country = "Gambia"
        if country == "The Gambia":
            country = "Gambia"

        confirmed = deaths = recovered = 0
        row[confirmed_index] = row[confirmed_index] if row[confirmed_index] else 0
        row[deaths_index]    = row[deaths_index]    if row[deaths_index]    else 0
        row[recovered_index] = row[recovered_index] if row[recovered_index] else 0

        confirmed = int(row[confirmed_index])
        deaths    = int(row[deaths_index])
        recovered = int(row[recovered_index])

        if file_format == "format2":
            row[0] = row[0] if row[0] else 0
            row[5] = row[5] if row[5] else 0.0
            row[6] = row[6] if row[6] else 0.0

        if country not in country_data_file:
            country_data_file[country] = [confirmed, deaths, recovered]
        else:
            if confirmed is not None:
                    country_data_file[country][0] += confirmed
            if deaths is not None:
                    country_data_file[country][1] += deaths
            if recovered is not None:
                country_data_file[country][2] += recovered

    # print(country_data)
    for key, value in country_data_file.items():
        print("%s,%d,%d,%d" % (key, value[0], value[1], value[2]))
