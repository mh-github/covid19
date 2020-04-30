class DashboardController < ApplicationController
  def cgdc
    query = <<-SQL 
        SELECT place, date, confirmed
        FROM global_daily_cumulative
    SQL

    @result = ActiveRecord::Base.connection.execute(query)
    render :json => @result
  end

  def cgdd
    query = <<-SQL 
        SELECT place, date, confirmed
        FROM global_daily_delta
    SQL

    @result = ActiveRecord::Base.connection.execute(query)
    render :json => @result
  end

  def cidc
    query = <<-SQL 
        SELECT place, date, confirmed
        FROM india_daily_cumulative
    SQL

    @result = ActiveRecord::Base.connection.execute(query)
    render :json => @result
  end

  def cidd
    query = <<-SQL 
        SELECT place, date, confirmed
        FROM india_daily_delta
    SQL

    @result = ActiveRecord::Base.connection.execute(query)
    render :json => @result
  end
end
