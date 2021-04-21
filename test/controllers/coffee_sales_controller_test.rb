require 'test_helper'

class CoffeeSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coffee_sale = coffee_sales(:one)
  end

  test "should get index" do
    get coffee_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_coffee_sale_url
    assert_response :success
  end

  test "should create coffee_sale" do
    assert_difference('CoffeeSale.count') do
      post coffee_sales_url, params: { coffee_sale: { blend: @coffee_sale.blend, date: @coffee_sale.date, origin: @coffee_sale.origin, price: @coffee_sale.price } }
    end

    assert_redirected_to coffee_sale_url(CoffeeSale.last)
  end

  test "should show coffee_sale" do
    get coffee_sale_url(@coffee_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_coffee_sale_url(@coffee_sale)
    assert_response :success
  end

  test "should update coffee_sale" do
    patch coffee_sale_url(@coffee_sale), params: { coffee_sale: { blend: @coffee_sale.blend, date: @coffee_sale.date, origin: @coffee_sale.origin, price: @coffee_sale.price } }
    assert_redirected_to coffee_sale_url(@coffee_sale)
  end

  test "should destroy coffee_sale" do
    assert_difference('CoffeeSale.count', -1) do
      delete coffee_sale_url(@coffee_sale)
    end

    assert_redirected_to coffee_sales_url
  end
end
