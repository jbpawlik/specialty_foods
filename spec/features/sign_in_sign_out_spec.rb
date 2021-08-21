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
    click_on "Sign out"
  end

  it "creates a user that cannot edit/update/delete" do
    visit "/signup"
    click_on "Sign Up"
    fill_in "user_email", :with => "admin@marios.com"
    fill_in "user_password", :with => "Admin2002!"
    fill_in "user_password_confirmation", :with => "Admin2002!"
    click_on "Sign Up"
    click_on "Sign out"
    visit "/signup"
    fill_in "user_email", :with => "a"
    fill_in "user_password", :with => "Password2002!"
    fill_in "user_password_confirmation", :with => "Password2002!"
    click_on "Sign Up"
    expect(page).to have_content("You've successfully signed")
    click_link "See All"
    expect(page).to have_no_content("Add New Product")
    visit "/products/new"
    expect(current_path).to eql("/signup")
    visit "/products/1/edit"
    expect(current_path).to eql("/signup")
    expect(page).to have_content("Only administrators")
    
    end
end
