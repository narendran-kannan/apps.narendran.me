require 'test_helper'

class Greenify::VolunteersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @greenify_volunteer = greenify_volunteers(:one)
  end

  test "should get index" do
    get greenify_volunteers_url
    assert_response :success
  end

  test "should get new" do
    get new_greenify_volunteer_url
    assert_response :success
  end

  test "should create greenify_volunteer" do
    assert_difference('Greenify::Volunteer.count') do
      post greenify_volunteers_url, params: { greenify_volunteer: { mail: @greenify_volunteer.mail, mcode: @greenify_volunteer.mcode, mobile: @greenify_volunteer.mobile, name: @greenify_volunteer.name, status: @greenify_volunteer.status } }
    end

    assert_redirected_to greenify_volunteer_url(Greenify::Volunteer.last)
  end

  test "should show greenify_volunteer" do
    get greenify_volunteer_url(@greenify_volunteer)
    assert_response :success
  end

  test "should get edit" do
    get edit_greenify_volunteer_url(@greenify_volunteer)
    assert_response :success
  end

  test "should update greenify_volunteer" do
    patch greenify_volunteer_url(@greenify_volunteer), params: { greenify_volunteer: { mail: @greenify_volunteer.mail, mcode: @greenify_volunteer.mcode, mobile: @greenify_volunteer.mobile, name: @greenify_volunteer.name, status: @greenify_volunteer.status } }
    assert_redirected_to greenify_volunteer_url(@greenify_volunteer)
  end

  test "should destroy greenify_volunteer" do
    assert_difference('Greenify::Volunteer.count', -1) do
      delete greenify_volunteer_url(@greenify_volunteer)
    end

    assert_redirected_to greenify_volunteers_url
  end
end
