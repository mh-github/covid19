require 'interactor'
require 'date'

class GenerateGddData
	include Interactor
	
	def array_diff(arr1, arr2)
		arr1.zip(arr2).map {|x, y| x.to_i - y.to_i}
	end

	def call
		gdc2 = context.data.dup
		country_data_hash = {}
		
		context.data.each do |key, value|
			# make previous day key
			prev_date = Date.new(key[0][0..3].to_i, key[0][5..6].to_i, key[0][8..9].to_i) - 1	
			prev_day_key = [prev_date.to_s, key[1]]

			if gdc2.has_key? prev_day_key
				country_data_hash[key] = array_diff(value, gdc2[prev_day_key])
			else
				country_data_hash[key] = value
			end
		end
		context.gdd = country_data_hash
	end
end