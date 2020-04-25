require 'date'

arg          = ARGV[0] # in %m-%d-%Y format
current_date = Date.strptime(arg, "%m-%d-%Y")
prev_date    = current_date-1

path1 = 'datasets/india_daily_delta/'
path2 = 'datasets/india_daily_cumulative/'

current_delta_file      = path1 + current_date.strftime("%m-%d-%Y") + '.csv'
prev_cumulative_file    = path2 + prev_date.strftime("%m-%d-%Y") + '.csv'

current_delta_file_data      = Hash.new {|hash, key| hash[key] = []}
prev_cumulative_file_data    = Hash.new {|hash, key| hash[key] = []}
output_data                  = Hash.new {|hash, key| hash[key] = []}

File.foreach(current_delta_file) do |line|
    line = line.split(',')
    current_delta_file_data[line[0]] << line[1].to_i << line[2].to_i << line[3].to_i
end

File.foreach(prev_cumulative_file) do |line|
    line = line.split(',')
    prev_cumulative_file_data[line[0]] << line[1].to_i << line[2].to_i << line[3].to_i
end

for key in current_delta_file_data.keys
    output_data[key] = [current_delta_file_data[key][0] + prev_cumulative_file_data[key][0],
                        current_delta_file_data[key][1] + prev_cumulative_file_data[key][1],
                        current_delta_file_data[key][2] + prev_cumulative_file_data[key][2]]
end

for key, value in output_data
    puts "#{key},#{value[0]},#{value[1]},#{value[2]}"
end