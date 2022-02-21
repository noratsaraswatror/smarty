class BloodReading < ApplicationRecord
	belongs_to :user 
	validate :blood_reading_limit, :on => :create
  
	 def blood_reading_limit
	 	  user = User.find(self.user_id)
	    if user && user.blood_readings.where('created_at >=? AND created_at <=?',Date.today.beginning_of_day,Date.today.end_of_day).count>= 4
	      errors.add(:base, "your are exceeding daily limit for blood glucose readings. Please try again tomorrow.")
	    end
	  end
end
