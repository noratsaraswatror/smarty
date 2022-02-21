require 'test_helper'

class BloodReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blood_reading = blood_readings(:one)
  end

  test "should get index" do
    get blood_readings_url
    assert_response :success
  end

  test "should get new" do
    get new_blood_reading_url
    assert_response :success
  end

  test "should create blood_reading" do
    assert_difference('BloodReading.count') do
      post blood_readings_url, params: { blood_reading: { blood_glucose_level: @blood_reading.blood_glucose_level, user_id: @blood_reading.user_id } }
    end

    assert_redirected_to blood_reading_url(BloodReading.last)
  end

  test "should show blood_reading" do
    get blood_reading_url(@blood_reading)
    assert_response :success
  end

  test "should get edit" do
    get edit_blood_reading_url(@blood_reading)
    assert_response :success
  end

  test "should update blood_reading" do
    patch blood_reading_url(@blood_reading), params: { blood_reading: { blood_glucose_level: @blood_reading.blood_glucose_level, user_id: @blood_reading.user_id } }
    assert_redirected_to blood_reading_url(@blood_reading)
  end

  test "should destroy blood_reading" do
    assert_difference('BloodReading.count', -1) do
      delete blood_reading_url(@blood_reading)
    end

    assert_redirected_to blood_readings_url
  end
end
