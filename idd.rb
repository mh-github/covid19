require 'httparty'
require 'json'

URL  = 'https://data.covid19india.org/v4/min/timeseries.min.json'
data = JSON.parse(HTTParty.get(URL).to_s)

for state in data.keys
    for date in data[state]['dates'].keys
        if data[state]['dates'][date]['delta']
            confirmed = data[state]['dates'][date]['delta']['confirmed'] || 0
            deceased  = data[state]['dates'][date.to_s]['delta']['deceased']  || 0
            recovered = data[state]['dates'][date.to_s]['delta']['recovered'] || 0
            puts "#{date},#{state},#{confirmed},#{deceased},#{recovered}"
        end
    end
end