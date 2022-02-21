class CreateBloodReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :blood_readings do |t|
      t.integer :blood_glucose_level
      t.integer :user_id

      t.timestamps
    end
  end
end
