json.extract! blood_reading, :id, :blood_glucose_level, :user_id, :created_at, :updated_at
json.url blood_reading_url(blood_reading, format: :json)
