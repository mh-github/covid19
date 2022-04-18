require 'httparty'
require 'json'

URL  = 'https://data.covid19india.org/v4/min/timeseries.min.json'
data = JSON.parse(HTTParty.get(URL).to_s)

for state in data.keys
    for date in data[state]['dates'].keys
        if data[state]['dates'][date]['delta']
            confirmed_delta = data[state]['dates'][date.to_s]['delta']['confirmed'] || 0
            deceased_delta  = data[state]['dates'][date.to_s]['delta']['deceased']  || 0
            recovered_delta = data[state]['dates'][date.to_s]['delta']['recovered'] || 0
            puts "#{date},#{state},#{confirmed_delta},#{deceased_delta},#{recovered_delta}"
        end
		
		if data[state]['dates'][date]['total']
			confirmed_total = data[state]['dates'][date.to_s]['total']['confirmed'] || 0
			deceased_total  = data[state]['dates'][date.to_s]['total']['deceased']  || 0
			recovered_total	= data[state]['dates'][date.to_s]['total']['recovered'] || 0
			puts "#{date},#{state},#{confirmed_total},#{deceased_total},#{recovered_total}"
		end
    end
end