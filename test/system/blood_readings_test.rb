require "application_system_test_case"

class BloodReadingsTest < ApplicationSystemTestCase
  setup do
    @blood_reading = blood_readings(:one)
  end

  test "visiting the index" do
    visit blood_readings_url
    assert_selector "h1", text: "Blood Readings"
  end

  test "creating a Blood reading" do
    visit blood_readings_url
    click_on "New Blood Reading"

    fill_in "Blood glucose level", with: @blood_reading.blood_glucose_level
    fill_in "User", with: @blood_reading.user_id
    click_on "Create Blood reading"

    assert_text "Blood reading was successfully created"
    click_on "Back"
  end

  test "updating a Blood reading" do
    visit blood_readings_url
    click_on "Edit", match: :first

    fill_in "Blood glucose level", with: @blood_reading.blood_glucose_level
    fill_in "User", with: @blood_reading.user_id
    click_on "Update Blood reading"

    assert_text "Blood reading was successfully updated"
    click_on "Back"
  end

  test "destroying a Blood reading" do
    visit blood_readings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blood reading was successfully destroyed"
  end
end
