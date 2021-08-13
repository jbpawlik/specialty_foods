require 'rails_helper'

describe "editing a product" do
  it "it edits a product" do
    visit "/signup"
    fill_in "user_email", :with => "admin@marios.com"
    fill_in "user_password", :with => "Admin2002!"
    fill_in "user_password_confirmation", :with => "Admin2002!"
    click_on "Sign Up"
    click_on "See All of Our Products"
    click_link 'Add Product'
    fill_in 'Name', :with => 'Salt'
    fill_in 'Cost', :with => '1.23'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    click_on 'Salt'
    click_on 'Edit Product'
    fill_in 'Name', :with => 'Pepper'
    click_on 'Update Product'
    expect(page).to have_content 'Pepper'
  end

  it "gives an error when no name is entered" do
    visit "/signup"
    fill_in "user_email", :with => "admin@marios.com"
    fill_in "user_password", :with => "Admin2002!"
    fill_in "user_password_confirmation", :with => "Admin2002!"
    click_on "Sign Up"
    click_on "See All of Our Products"
    click_link 'Add Product'
    fill_in 'Name', :with => 'Salt'
    fill_in 'Cost', :with => '1.23'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    click_on 'Salt'
    click_on 'Edit Product'
    fill_in 'Name', :with => ''
    click_on 'Update Product'
    expect(page).to have_content "Name can't be blank"
  end
end