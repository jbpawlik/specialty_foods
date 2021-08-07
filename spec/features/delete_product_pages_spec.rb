require 'rails_helper'

describe "deleting a product" do
  it "deletes a product" do
    visit products_path
    click_link 'Add Product'
    fill_in 'Name', :with => 'Salt'
    fill_in 'Cost', :with => '1.23'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    click_on 'Salt'
    click_on 'Delete'
    expect(page).to have_no_content 'Salt'
  end
end