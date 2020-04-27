# Make master files collating file content in each directory under datasets.
# For example, content of all files in global_daily_cumulative will be collated in global_daily_cumulative.csv
# Each line in the master file will have the data's date as the first field.
sub_dirs = ['global_daily_cumulative', 'global_daily_delta', 'india_daily_cumulative', 'india_daily_delta']

for sub_dir in sub_dirs
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