require "application_system_test_case"

class FundraisersTest < ApplicationSystemTestCase
  setup do
    @fundraiser = fundraisers(:one)
  end

  test "visiting the index" do
    visit fundraisers_url
    assert_selector "h1", text: "Fundraisers"
  end

  test "creating a Fundraiser" do
    visit fundraisers_url
    click_on "New Fundraiser"

    fill_in "Description", with: @fundraiser.description
    fill_in "Funds aim", with: @fundraiser.funds_aim
    fill_in "Funds current", with: @fundraiser.funds_current
    fill_in "Funds percentage", with: @fundraiser.funds_percentage
    fill_in "Payments total count", with: @fundraiser.payments_total_count
    fill_in "Title", with: @fundraiser.title
    click_on "Create Fundraiser"

    assert_text "Fundraiser was successfully created"
    click_on "Back"
  end

  test "updating a Fundraiser" do
    visit fundraisers_url
    click_on "Edit", match: :first

    fill_in "Description", with: @fundraiser.description
    fill_in "Funds aim", with: @fundraiser.funds_aim
    fill_in "Funds current", with: @fundraiser.funds_current
    fill_in "Funds percentage", with: @fundraiser.funds_percentage
    fill_in "Payments total count", with: @fundraiser.payments_total_count
    fill_in "Title", with: @fundraiser.title
    click_on "Update Fundraiser"

    assert_text "Fundraiser was successfully updated"
    click_on "Back"
  end

  test "destroying a Fundraiser" do
    visit fundraisers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fundraiser was successfully destroyed"
  end
end
