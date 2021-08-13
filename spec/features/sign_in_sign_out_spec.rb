require 'rails_helper'

describe "signing in and out" do
  it "creates user and signs in and out" do
    visit "/signup"
    click_on "Sign Up"
    expect(page).to have_content("There was a problem signing up")
    fill_in "user_email", :with => "admin@marios.com"
    fill_in "user_password", :with => "Admin2002!"
    fill_in "user_password_confirmation", :with => "Admin2002!"
    click_on "Sign Up"
    click_on "Sign out"
    expect(page).to have_content("You've signed out.")
    click_on "Sign in"
    fill_in "Email", :with => "admin@marios.com"
    click_on "Sign in"
    expect(page).to have_content("There was a problem")
    fill_in "Email", :with => "admin@marios.com"
    fill_in "Password", :with => "Admin2002!"
    click_on "Sign in"
    expect(page).to have_content("You've signed in.")
  end
end
