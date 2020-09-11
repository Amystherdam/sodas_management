require "application_system_test_case"

class SodasTest < ApplicationSystemTestCase
  setup do
    @soda = sodas(:one)
  end

  test "visiting the index" do
    visit sodas_url
    assert_selector "h1", text: "Sodas"
  end

  test "creating a Soda" do
    visit sodas_url
    click_on "New Soda"

    fill_in "Brand", with: @soda.brand
    fill_in "Capacity", with: @soda.capacity
    fill_in "Category", with: @soda.category
    fill_in "Flavor", with: @soda.flavor
    fill_in "Price", with: @soda.price
    fill_in "Quantiti", with: @soda.quantiti
    click_on "Create Soda"

    assert_text "Soda was successfully created"
    click_on "Back"
  end

  test "updating a Soda" do
    visit sodas_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @soda.brand
    fill_in "Capacity", with: @soda.capacity
    fill_in "Category", with: @soda.category
    fill_in "Flavor", with: @soda.flavor
    fill_in "Price", with: @soda.price
    fill_in "Quantiti", with: @soda.quantiti
    click_on "Update Soda"

    assert_text "Soda was successfully updated"
    click_on "Back"
  end

  test "destroying a Soda" do
    visit sodas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Soda was successfully destroyed"
  end
end
