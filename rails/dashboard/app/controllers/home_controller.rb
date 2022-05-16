class HomeController < ApplicationController

  @@country    = ""
  @@state      = ""
  @@start_date = ""
  @@end_date   = ""
  @@error      = ""

  def index
      if @@error != ""
          @error = @@error
      end
  end

  def is_valid_date? aDateStr
      if aDateStr
          y, m, d = aDateStr.split '-'
          date_one_valid = Date.valid_date? y.to_i, m.to_i, d.to_i
      end
  end

  def validate_dates aDateStr1, aDateStr2
      @@error      = ""
      if ! is_valid_date? aDateStr1
          @@error = "Invalid Start Date Entered"
      elsif ! is_valid_date? aDateStr2
          @@error = "Invalid End Date Entered"
      else  
          date_one = Date.strptime(aDateStr1,'%Y-%m-%d')
          date_two = Date.strptime(aDateStr2,'%Y-%m-%d')
          if date_one > date_two
              @@error = "Start Date should be earlier than End Date"
          end
      end
  end

  def adjusted_global_dates aDateStr1, aDateStr2
      date_one = Date.strptime(aDateStr1.to_s,'%Y-%m-%d')
      if date_one < Global_min_date
          date_one = Global_min_date
      end

      date_two = Date.strptime(aDateStr2.to_s,'%Y-%m-%d')
      if date_two > Global_max_date
          date_two = Global_max_date
      end
      return date_one, date_two
  end

  def adjusted_india_dates aDateStr1, aDateStr2
      date_one = Date.strptime(aDateStr1.to_s,'%Y-%m-%d')
      if date_one < India_min_date
          date_one = India_min_date
      end

      date_two = Date.strptime(aDateStr2.to_s,'%Y-%m-%d')
      if date_two > India_max_date
          date_two = India_max_date
      end
      return date_one, date_two
  end

  def display_router
      @@country    = params[:country]
      @@state      = params[:state]
      graph        = params[:commit]
      @@start_date = params[:start_date]
      @@end_date   = params[:end_date]

      validate_dates @@start_date, @@end_date
      
      if @@error != ""
          redirect_to action: :index
      elsif graph == "GDC"
          redirect_to action: :gdc
      elsif graph == "GDD"
          redirect_to action: :gdd
      elsif graph == "IDD"
          redirect_to action: :idd
      elsif graph == "IDC"
          redirect_to action: :idc
      end
  end

  def gdc
      @error     = ""
      @confirmed = []
      @deaths    = []
      @recovered = []

      @@start_date, @@end_date = adjusted_global_dates @@start_date, @@end_date
      records    = Gdc.where(place: @@country).where(:date => @@start_date..@@end_date)
      if records.empty?
          @error = "No records found for the given date range #{@@start_date.to_s[0..9]} .. #{@@end_date.to_s[0..9]}"
      else
          records.each do |record|
              @confirmed << [record['date'], record['confirmed']]
              @deaths    << [record['date'], record['deaths']]
              @recovered << [record['date'], record['recovered']]
          end
      end
      @place, @start_date, @end_date = @@country, @@start_date.to_s[0..9], @@end_date.to_s[0..9]
  end

  def gdd
      @error     = ""
      @confirmed = []
      @deaths    = []
      @recovered = []

      @@start_date, @@end_date = adjusted_global_dates @@start_date, @@end_date
      records    = Gdd.where(place: @@country).where(:date => @@start_date..@@end_date)
      if records.empty?
          @error = "No records found for the given date range #{@@start_date.to_s[0..9]} .. #{@@end_date.to_s[0..9]}"
      else
          records.each do |record|
              @confirmed << [record['date'], record['confirmed']]
              @deaths    << [record['date'], record['deaths']]
              @recovered << [record['date'], record['recovered']]
          end
      end
      @place, @start_date, @end_date = @@country, @@start_date.to_s[0..9], @@end_date.to_s[0..9]
  end

  def idc
      @error     = ""
      @confirmed = []
      @deaths    = []
      @recovered = []

      @@start_date, @@end_date = adjusted_india_dates @@start_date, @@end_date
      records    = Idc.where(place: @@state).where(:date => @@start_date..@@end_date)
      if records.empty?
          @error = "No records found for the given date range #{@@start_date} .. #{@@end_date}"
      else
          records.each do |record|
              @confirmed << [record['date'], record['confirmed']]
              @deaths    << [record['date'], record['deaths']]
              @recovered << [record['date'], record['recovered']]
          end
      end
      @place, @start_date, @end_date = @@state, @@start_date.to_s[0..9], @@end_date.to_s[0..9]
  end

  def idd
      @error     = ""
      @confirmed = []
      @deaths    = []
      @recovered = []

      @@start_date, @@end_date = adjusted_india_dates @@start_date, @@end_date
      records    = Idd.where(place: @@state).where(:date => @@start_date..@@end_date)
      if records.empty?
          @error = "No records found for the given date range #{@@start_date} .. #{@@end_date}"
      else
          records.each do |record|
              @confirmed << [record['date'], record['confirmed']]
              @deaths    << [record['date'], record['deaths']]
              @recovered << [record['date'], record['recovered']]
          end
      end
      @place, @start_date, @end_date = @@state, @@start_date.to_s[0..9], @@end_date.to_s[0..9]
  end
end