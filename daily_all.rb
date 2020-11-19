# Make master files collating file content in each directory under datasets.
# For example, content of all files in global_daily_cumulative will be collated in global_daily_cumulative.csv
# Each line in the master file will have the data's date as the first field.
states = {
    "an" => "Andaman Nicobar",
    "ap" => "Andhra Pradesh",
    "ar" => "Arunachal Pradesh",
    "as" => "Assam",
    "br" => "Bihar",
    "ch" => "Chandigarh",
    "ct" => "Chattigarh",
    "dd" => "Daman Diu",
    "dl" => "Delhi",
    "dn" => "Dadra Nagar Haveli",
    "ga" => "Goa",
    "gj" => "Gujarat",
    "hp" => "Himachal Pradesh",
    "hr" => "Haryana",
    "jh" => "Jharkand",
    "jk" => "Jammu Kashmir",
    "ka" => "Karnataka",
    "kl" => "Kerala",
    "la" => "Lakshadweep",
    "ld" => "Ladakh",
    "mh" => "Maharashtra",
    "ml" => "Meghalaya",
    "mn" => "Manipur",
    "mp" => "Madhya Pradesh",
    "mz" => "Mizoram",
    "nl" => "Nagaland",
    "or" => "Odisha",
    "pb" => "Punjab",
    "py" => "Puducherry",
    "rj" => "Rajasthan",
    "sk" => "Sikkim",
    "tg" => "Telangana",
    "tn" => "Tamil Nadu",
    "tr" => "Tripura",
    "tt" => "tt",
    "un" => "Unidentified",
    "up" => "Uttar Pradesh",
    "ut" => "Uttarakhand",
    "wb" => "West Bengal"
}
global_dirs = ['global_daily_cumulative', 'global_daily_delta']
india_dirs  = ['india_daily_cumulative', 'india_daily_delta']

for sub_dir in global_dirs
    outfile = sub_dir + '.csv'
    File.open(outfile, 'w') do |f|
        Dir["datasets/#{sub_dir}/*.csv"].each do |file|
            file_date = File.basename(file).split('.')[0]
            File.foreach(file) do |line|
                f.write(file_date,',',line)
            end
        end
    end
end

for sub_dir in india_dirs
    outfile = sub_dir + '.csv'
    File.open(outfile, 'w') do |f|
        Dir["datasets/#{sub_dir}/*.csv"].each do |file|
            file_date = File.basename(file).split('.')[0]
            File.foreach(file) do |line|
                arr = line.split(',')
                next if arr[0] == 'dateymd'
                str = "#{file_date},#{states[arr[0]]},#{arr[1]},#{arr[2]},#{arr[3]}"
                f.write(str)
            end
        end
    end
end