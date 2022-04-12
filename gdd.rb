require 'date'
require 'csv'

def array_diff(arr1, arr2)
    arr1.zip(arr2).map {|x, y| x.to_i - y.to_i}
end

file_path = ARGV[0]
path      = File.dirname(file_path)
file_name = File.basename(file_path, ".*")

# puts file_name
file_date   = Date.new(file_name[6..9].to_i, file_name[0..1].to_i, file_name[3..4].to_i)

# check file date
if file_date < Date.new(2020, 01, 22)
    puts "Date available in dataset from 22-Jan-2020 onwards."
    puts "Exiting the program."
end

# read current file and store in hash
current = {}
CSV.foreach file_path do |row|
    current[row[0]] = [row[1], row[2], row[3]]
end

# for the very first day's file, just print out the contents
if file_name == '01-22-2020'
    current.each do |key, value| 
        puts "#{key}, #{value[0]}, #{value[1]}, #{value[2]}" 
    end
    exit(0)
end

# read the previous date's global data delta file into a hash
prev_date = file_date-1
prev_file = path + '/' + prev_date.strftime("%m-%d-%Y").to_s + '.csv'

# read the previous day's global data delta file into a hash
prev = {}
CSV.foreach prev_file do |row|
    prev[row[0]] = [row[1], row[2], row[3]]
end

current.each do |key, value|
    daily_delta = (prev.has_key? key) ? array_diff(current[key], prev[key]) : current[key]
    puts "#{key},#{daily_delta[0]},#{daily_delta[1]},#{daily_delta[2]}"
end