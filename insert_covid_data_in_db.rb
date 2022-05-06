require 'interactor'
require 'csv'
require 'pg'

class InsertCovidDataInDb
	include Interactor
	
	def call
		conn = PG.connect(
			host: 	  '127.0.0.1',
			dbname:   'covid19',
			port: 	  5434,
			user: 	  'postgres',
			password: 'postgres'
		)

		tables = ['global_daily_cumulative', 'global_daily_delta', 'india_daily_cumulative', 'india_daily_delta']

		tables.each do |table|
			puts "deleting all rows from #{table}."
			sql = "delete from #{table}"
			conn.exec sql
		
			puts "Reading data from #{table}.csv"
			sql = "insert into #{table} (date, place, confirmed, deaths, recovered, created_at, updated_at) values "
			CSV.foreach "#{table}.csv" do |row|
				sql += "('#{row[0]}','#{row[1].gsub("'", " ")}',#{row[2]}, #{row[3]}, #{row[4]}, now(), now()),"
			end
			
			puts "Inserting data into #{table}."
			starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
			conn.exec sql.chomp(',')
			ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
			puts "Finished inserting data into #{table}. Time taken = #{(ending - starting).round(3)} seconds."
		end
	end
end