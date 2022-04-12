# import os, sys, csv
# from datetime import datetime
require 'date'
require 'csv'

country_data_file = {}
file_path         = ARGV[0]
file_name		  = File.basename(file_path, ".*")

indexes_to_read = {}
indexes_to_read['format1'] = [1,3,4,5]
indexes_to_read['format2'] = [3,7,8,9]

# if file_name is before 03-22-2020, file_format = format1 else format2
file_date   = Date.new(file_name[6..9].to_i, file_name[0..1].to_i, file_name[3..4].to_i)
file_format = file_date < Date.new(2020, 03, 22) ? "format1" : "format2"

country_index     = indexes_to_read[file_format][0]
confirmed_index   = indexes_to_read[file_format][1]
deaths_index      = indexes_to_read[file_format][2]
recovered_index   = indexes_to_read[file_format][3]

CSV.foreach file_path, {headers: true} do |row|
	country = row[country_index]
	if country == "Mainland China"
		country = "China"
	elsif country == "Korea, South"
		country = "South Korea"
	elsif country == "Gambia, The"
		country = "Gambia"
	elsif country == "Bahamas, The"
		country = "Bahamas"
	elsif country == "The Bahamas"
		country = "Bahamas"
	elsif country == "Gambia, The"
		country = "Gambia"
	elsif country == "The Gambia"
		country = "Gambia"
	end
	
	row[confirmed_index] = row[confirmed_index] ? row[confirmed_index] : 0
	row[deaths_index]    = row[deaths_index]    ? row[deaths_index]    : 0
	row[recovered_index] = row[recovered_index] ? row[recovered_index] : 0
	
	confirmed = row[confirmed_index].to_i
	deaths    = row[deaths_index].to_i
	recovered = row[recovered_index].to_i
	
	if file_format == "format2"
		row[0] = row[0] ? row[0] : 0
		row[5] = row[5] ? row[5] : 0.0
		row[6] = row[6] ? row[6] : 0.0
	end
	
	if country_data_file.has_key? country
		country_data_file[country][0] += confirmed if confirmed
        country_data_file[country][1] += deaths if deaths
		country_data_file[country][2] += recovered if recovered
	else
		country_data_file[country] = [confirmed, deaths, recovered]
	end
end

country_data_file.each do |key, value|
	puts "#{key},#{value[0]},#{value[1]},#{value[2]}"
end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	