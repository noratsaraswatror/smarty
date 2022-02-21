class ReportsController < ApplicationController
  def index
  	puts params
  end
  def daily_report
  	start_date = Date.today.beginning_of_day
  	end_date = Date.today.end_of_day
  	blood_readings = current_user.blood_readings
  	@average_glucose = average_glucose(blood_readings,start_date,end_date)
  	@max_glucose = max_glucose(blood_readings,start_date,end_date)
  	@min_glucose = min_glucose(blood_readings,start_date,end_date)
  end
  def monthly_report
  	start_date = Date.today.beginning_of_month
  	end_date = Date.today.end_of_month
  	blood_readings = current_user.blood_readings
  	@average_glucose = average_glucose(blood_readings,start_date,end_date)
  	@max_glucose = max_glucose(blood_readings,start_date,end_date)
  	@min_glucose = min_glucose(blood_readings,start_date,end_date)
  end
  def month_on_report
  	start_date = Date.today.beginning_of_month
  	puts Date.strptime(params[:date_end], "%d/%m/%Y")
  	#puts DatesFromString.new params[:date_end]
  	end_date = params[:date_end].to_date
  	blood_readings = current_user.blood_readings
  	@average_glucose = average_glucose(blood_readings,start_date,end_date)
  	@max_glucose = max_glucose(blood_readings,start_date,end_date)
  	@min_glucose = min_glucose(blood_readings,start_date,end_date)
  end

  def average_glucose(blood_readings,start_date,end_date)
    blood_readings.where('created_at >=? AND created_at <=?',start_date, end_date).average(:blood_glucose_level)
  end
  def max_glucose(blood_readings,start_date,end_date)
    blood_readings.where('created_at >=? AND created_at <=?',start_date, end_date).maximum(:blood_glucose_level)
  end
  def min_glucose(blood_readings,start_date,end_date)
    blood_readings.where('created_at >=? AND created_at <=?',start_date, end_date).minimum(:blood_glucose_level)
  end
end
