require 'test_helper'

class WbCanvasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wb_canva = wb_canvas(:one)
  end

  test "should get index" do
    get wb_canvas_url
    assert_response :success
  end

  test "should get new" do
    get new_wb_canva_url
    assert_response :success
  end

  test "should create wb_canva" do
    assert_difference('WbCanva.count') do
      post wb_canvas_url, params: { wb_canva: { img_data: @wb_canva.img_data, name: @wb_canva.name } }
    end

    assert_redirected_to wb_canva_url(WbCanva.last)
  end

  test "should show wb_canva" do
    get wb_canva_url(@wb_canva)
    assert_response :success
  end

  test "should get edit" do
    get edit_wb_canva_url(@wb_canva)
    assert_response :success
  end

  test "should update wb_canva" do
    patch wb_canva_url(@wb_canva), params: { wb_canva: { img_data: @wb_canva.img_data, name: @wb_canva.name } }
    assert_redirected_to wb_canva_url(@wb_canva)
  end

  test "should destroy wb_canva" do
    assert_difference('WbCanva.count', -1) do
      delete wb_canva_url(@wb_canva)
    end

    assert_redirected_to wb_canvas_url
  end
end
