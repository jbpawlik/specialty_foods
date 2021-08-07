require 'rails_helper'

describe "editing a product" do
  it "it edits a product" do
    visit products_path
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
end