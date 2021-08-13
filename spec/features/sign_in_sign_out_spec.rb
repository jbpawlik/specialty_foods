require 'rails_helper'

describe "signing in and out" do
  it "creates user and signs in" do
    visit "/signup"
    fill_in "user_email", :with => "admin@marios.com"
    fill_in "user_password", :with => "Admin2002!"
    fill_in "user_password_confirmation", :with => "Admin2002!"
    click_on "Sign Up"
    click_on "Sign out"
    expect(page).to have_content("You've signed out.")
  end
end
