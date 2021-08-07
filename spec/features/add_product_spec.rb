require 'rails_helper'

describe "adding a product" do
  it "adds a new product" do
    visit '/'
    click_link 'See All of Our Products'
    click_link 'Add Product'
    fill_in 'Name', :with => 'Salt'
    fill_in 'Cost', :with => '1.23'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Salt'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end