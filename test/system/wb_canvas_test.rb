require "application_system_test_case"

class WbCanvasTest < ApplicationSystemTestCase
  setup do
    @wb_canva = wb_canvas(:one)
  end

  test "visiting the index" do
    visit wb_canvas_url
    assert_selector "h1", text: "Wb Canvas"
  end

  test "creating a Wb canva" do
    visit wb_canvas_url
    click_on "New Wb Canva"

    fill_in "Img data", with: @wb_canva.img_data
    fill_in "Name", with: @wb_canva.name
    click_on "Create Wb canva"

    assert_text "Wb canva was successfully created"
    click_on "Back"
  end

  test "updating a Wb canva" do
    visit wb_canvas_url
    click_on "Edit", match: :first

    fill_in "Img data", with: @wb_canva.img_data
    fill_in "Name", with: @wb_canva.name
    click_on "Update Wb canva"

    assert_text "Wb canva was successfully updated"
    click_on "Back"
  end

  test "destroying a Wb canva" do
    visit wb_canvas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wb canva was successfully destroyed"
  end
end
