require 'rest-client'
require 'json'

# Read in commmand-line parameter
fetch_date  = ARGV[0]

response = RestClient::Request.new(
    :method => :get,
    :url    => 'https://api.covid19india.org/states_daily.json'
).execute
results = JSON.parse(response.to_str)

daily_states_data = Hash.new {|hash, key| hash[key] = []}

for result in results['states_daily']
    if result['date'] == fetch_date
        if result['status'] == 'Confirmed'
            result.each do |key, value|
                next if ['date', 'status'].include? key
                daily_states_data[key][0] = value.to_i
            end
        end
        
        if result['status'] == 'Deceased'
            result.each do |key, value|
                next if ['date', 'status'].include? key
                daily_states_data[key][1] = value.to_i
            end
        end

        if result['status'] == 'Recovered'
            result.each do |key, value|
                next if ['date', 'status'].include? key
                daily_states_data[key][2] = value.to_i
            end
        end
    end
end

daily_states_data.each do |key, value|
    puts "#{key},#{value[0]},#{value[1]},#{value[2]}"
end