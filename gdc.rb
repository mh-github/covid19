require 'interactor'
require 'date'
require 'csv'

$indexes_to_read = {}
$indexes_to_read['format1'] = [1,3,4,5]
$indexes_to_read['format2'] = [3,7,8,9]
	
class GenerateGdcData
	include Interactor
			
	def call
		country_data_hash = {}
		Dir[context.folder + '/*.csv'].each do |file_path|
			file_name = File.basename(file_path, ".*")
			
			# if file_name is before 03-22-2020, file_format = format1 else format2
			file_date     = Date.new(file_name[6..9].to_i, file_name[0..1].to_i, file_name[3..4].to_i)
			file_format   = file_date < Date.new(2020, 03, 22) ? "format1" : "format2"
			file_date_str = file_date.to_s
			
			country_index     = $indexes_to_read[file_format][0]
			confirmed_index   = $indexes_to_read[file_format][1]
			deaths_index      = $indexes_to_read[file_format][2]
			recovered_index   = $indexes_to_read[file_format][3]

			CSV.foreach(file_path, headers: true) do |row|
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

				if country_data_hash.has_key? [file_date,country]
					country_data_hash[[file_date_str,country]][0] += confirmed if confirmed
					country_data_hash[[file_date_str,country]][1] += deaths if deaths
					country_data_hash[[file_date_str,country]][2] += recovered if recovered
				else
					country_data_hash[[file_date_str,country]] = [confirmed, deaths, recovered]
				end
			end
		end
		context.gdc = country_data_hash
	end
end