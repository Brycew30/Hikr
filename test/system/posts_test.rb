require "application_system_test_case"

class trailsTest < ApplicationSystemTestCase
  setup do
    @trail = trails(:one)
  end

  test "visiting the index" do
    visit trails_url
    assert_selector "h1", text: "trails"
  end

  test "creating a Trail" do
    visit trails_url
    click_on "New Trail"

    fill_in "Body", with: @trail.body
    fill_in "Title", with: @trail.title
    click_on "Create Trail"

    assert_text "Trail was successfully created"
    click_on "Back"
  end

  test "updating a Trail" do
    visit trails_url
    click_on "Edit", match: :first

    fill_in "Body", with: @trail.body
    fill_in "Title", with: @trail.title
    click_on "Update Trail"

    assert_text "Trail was successfully updated"
    click_on "Back"
  end

  test "destroying a Trail" do
    visit trails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trail was successfully destroyed"
  end
end
