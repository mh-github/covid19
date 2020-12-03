import  sys, os, csv
from datetime import datetime, timedelta

def array_diff(array1, array2):
    return [array1 - array2 for array1, array2 in zip(array1, array2)]

file_path         = sys.argv[1] # should be like 03-25-2020 i.e. %m-%d-%Y format
file_name         = os.path.basename(file_path)
path              = os.path.dirname(file_path)

date_str  = file_name.split('.')[0]
file_date = datetime.strptime(date_str, "%m-%d-%Y").date()
prev_date = file_date - timedelta(days=1)

date2 = datetime.strptime("01-22-2020", "%m-%d-%Y").date()
if file_date < date2:
    print("Date available in dataset from 22-Jan-2020 onwards")
    exit(1)

# Read current file and store in dictionary
current = {}
with open(sys.argv[1]) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    for row in csv_reader:
        current[row[0]] = [int(row[1]), int(row[2]), int(row[3])]

if date_str == '01-22-2020':
    for (key, value) in current.items():
        print("%s,%d,%d,%d" % (key, value[0], value[1], value[2]))
    exit(0)

prev = {}
prev_file = path + '/' + prev_date.strftime("%m-%d-%Y") + '.csv'
with open(prev_file) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    for row in csv_reader:
        prev[row[0]] = [int(row[1]), int(row[2]), int(row[3])]

for key in current.keys():
    if key in prev:
        daily_delta = array_diff(current[key], prev[key])
    else:
        daily_delta = current[key] # new entry for today
    print("%s,%d,%d,%d" % (key, daily_delta[0], daily_delta[1], daily_delta[2]))