require './gdc'
require './gdd'
require './idc'
require './idd'
require './insert_covid_data_in_db'

# Read files in COVID19 folder
COVID19_root_path = ARGV[0]
data_folder = COVID19_root_path + '/csse_covid_19_data/csse_covid_19_daily_reports'

# Generate global daily cumulative data
gdc = GenerateGdcData.call({folder:data_folder}).gdc
puts "After calling GenerateGdcData"
puts "Writing to global_daily_cumulative.csv"
open('global_daily_cumulative.csv', 'w') do |f|
	gdc.each do |key, value|
		f.puts "#{key[0]},#{key[1]},#{value[0]},#{value[1]},#{value[2]}"
	end
end

# Generate global daily delta data
gdd = GenerateGddData.call({data:gdc}).gdd
puts "After calling GenerateGddData"
puts "Writing to global_daily_delta.csv"
open('global_daily_delta.csv', 'w') do |f|
	gdd.each do |key, value|
		f.puts "#{key[0]},#{key[1]},#{value[0]},#{value[1]},#{value[2]}"
	end
end

# Generate India daily cumulative data
idc = GenerateIdcData.call.idc
puts "After calling GenerateIdcData"
puts "Writing to india_daily_cumulative.csv"
open('india_daily_cumulative.csv', 'w') do |f|
	idc.each do |record|
		f.puts "#{record[0]},#{record[1]},#{record[2]},#{record[3]},#{record[4]}"
	end
end

# Generate India daily delta data
idd = GenerateIddData.call.idd
puts "After calling GenerateIddData"
puts "Writing to india_daily_delta.csv"
open('india_daily_delta.csv', 'w') do |f|
	idd.each do |record|
		f.puts "#{record[0]},#{record[1]},#{record[2]},#{record[3]},#{record[4]}"
	end
end

InsertCovidDataInDb.call