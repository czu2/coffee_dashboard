require "application_system_test_case"

class CoffeeSalesTest < ApplicationSystemTestCase
  setup do
    @coffee_sale = coffee_sales(:one)
  end

  test "visiting the index" do
    visit coffee_sales_url
    assert_selector "h1", text: "Coffee Sales"
  end

  test "creating a Coffee sale" do
    visit coffee_sales_url
    click_on "New Coffee Sale"

    fill_in "Blend", with: @coffee_sale.blend
    fill_in "Date", with: @coffee_sale.date
    fill_in "Origin", with: @coffee_sale.origin
    fill_in "Price", with: @coffee_sale.price
    click_on "Create Coffee sale"

    assert_text "Coffee sale was successfully created"
    click_on "Back"
  end

  test "updating a Coffee sale" do
    visit coffee_sales_url
    click_on "Edit", match: :first

    fill_in "Blend", with: @coffee_sale.blend
    fill_in "Date", with: @coffee_sale.date
    fill_in "Origin", with: @coffee_sale.origin
    fill_in "Price", with: @coffee_sale.price
    click_on "Update Coffee sale"

    assert_text "Coffee sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Coffee sale" do
    visit coffee_sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coffee sale was successfully destroyed"
  end
end
