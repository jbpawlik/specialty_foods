require 'rails_helper'

describe "adding a product" do
  it "adds a new product" do
    Product.destroy_all
    visit "/signup"
    fill_in "user_email", :with => "admin@marios.com"
    fill_in "user_password", :with => "Admin2002!"
    fill_in "user_password_confirmation", :with => "Admin2002!"
    click_on "Sign Up"
    visit "/signin"
    fill_in "email", :with => "admin@marios.com"
    fill_in "password", :with => "Admin2002!"
    click_on "Sign in"
    visit '/products/new'
    fill_in 'Name', :with => 'Salt'
    fill_in 'Cost', :with => '1.23'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Salt'
    page.driver.submit :delete, "/products/#{Product.last.id}", {}
    expect(page).to have_content "Product successfully deleted!"
  end

  it "gives an error when no name is entered" do
    visit "/signup"
    fill_in "user_email", :with => "admin@marios.com"
    fill_in "user_password", :with => "Admin2002!"
    fill_in "user_password_confirmation", :with => "Admin2002!"
    click_on "Sign Up"
    visit "/signin"
    fill_in "email", :with => "admin@marios.com"
    fill_in "password", :with => "Admin2002!"
    click_on "Sign in"
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end