require 'interactor'
require 'httparty'
require 'json'

class GenerateIdcData
	include Interactor
	
	def call
		url  = 'https://data.covid19india.org/v4/min/timeseries.min.json'
		data = JSON.parse(HTTParty.get(url).to_s)
		india_data_cumulative = []
		
		for state in data.keys
			for date in data[state]['dates'].keys
				if data[state]['dates'][date]['total']
					confirmed = data[state]['dates'][date.to_s]['total']['confirmed'] || 0
					deceased  = data[state]['dates'][date.to_s]['total']['deceased']  || 0
					recovered = data[state]['dates'][date.to_s]['total']['recovered'] || 0
					india_data_cumulative << [date, state, confirmed, deceased, recovered]
				end
			end
		end
		context.idc = india_data_cumulative
	end
end