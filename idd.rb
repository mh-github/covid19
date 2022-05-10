require 'interactor'
require 'httparty'
require 'json'

class GenerateIddData
	include Interactor
	
	def call
		url  = 'https://data.covid19india.org/v4/min/timeseries.min.json'
		data = JSON.parse(HTTParty.get(url).to_s)
		india_data_delta = []

		for state in data.keys
			for date in data[state]['dates'].keys
				if data[state]['dates'][date]['delta']
					confirmed = data[state]['dates'][date.to_s]['delta']['confirmed'] || 0
					deceased  = data[state]['dates'][date.to_s]['delta']['deceased']  || 0
					recovered = data[state]['dates'][date.to_s]['delta']['recovered'] || 0
					india_data_delta << [date, state, confirmed, deceased, recovered]
				end
			end
		end
		context.idd = india_data_delta
	end
end