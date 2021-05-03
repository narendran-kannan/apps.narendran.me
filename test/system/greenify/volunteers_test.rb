require "application_system_test_case"

class Greenify::VolunteersTest < ApplicationSystemTestCase
  setup do
    @greenify_volunteer = greenify_volunteers(:one)
  end

  test "visiting the index" do
    visit greenify_volunteers_url
    assert_selector "h1", text: "Greenify/Volunteers"
  end

  test "creating a Volunteer" do
    visit greenify_volunteers_url
    click_on "New Greenify/Volunteer"

    fill_in "Mail", with: @greenify_volunteer.mail
    fill_in "Mcode", with: @greenify_volunteer.mcode
    fill_in "Mobile", with: @greenify_volunteer.mobile
    fill_in "Name", with: @greenify_volunteer.name
    fill_in "Status", with: @greenify_volunteer.status
    click_on "Create Volunteer"

    assert_text "Volunteer was successfully created"
    click_on "Back"
  end

  test "updating a Volunteer" do
    visit greenify_volunteers_url
    click_on "Edit", match: :first

    fill_in "Mail", with: @greenify_volunteer.mail
    fill_in "Mcode", with: @greenify_volunteer.mcode
    fill_in "Mobile", with: @greenify_volunteer.mobile
    fill_in "Name", with: @greenify_volunteer.name
    fill_in "Status", with: @greenify_volunteer.status
    click_on "Update Volunteer"

    assert_text "Volunteer was successfully updated"
    click_on "Back"
  end

  test "destroying a Volunteer" do
    visit greenify_volunteers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Volunteer was successfully destroyed"
  end
end
