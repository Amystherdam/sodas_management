require 'test_helper'

class SodasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @soda = sodas(:one)
  end

  test "should get index" do
    get sodas_url
    assert_response :success
  end

  test "should get new" do
    get new_soda_url
    assert_response :success
  end

  test "should create soda" do
    assert_difference('Soda.count') do
      post sodas_url, params: { soda: { brand: @soda.brand, capacity: @soda.capacity, category: @soda.category, flavor: @soda.flavor, price: @soda.price, quantiti: @soda.quantiti } }
    end

    assert_redirected_to soda_url(Soda.last)
  end

  test "should show soda" do
    get soda_url(@soda)
    assert_response :success
  end

  test "should get edit" do
    get edit_soda_url(@soda)
    assert_response :success
  end

  test "should update soda" do
    patch soda_url(@soda), params: { soda: { brand: @soda.brand, capacity: @soda.capacity, category: @soda.category, flavor: @soda.flavor, price: @soda.price, quantiti: @soda.quantiti } }
    assert_redirected_to soda_url(@soda)
  end

  test "should destroy soda" do
    assert_difference('Soda.count', -1) do
      delete soda_url(@soda)
    end

    assert_redirected_to sodas_url
  end
end
