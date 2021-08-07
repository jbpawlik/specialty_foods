require 'rails_helper'

describe "adding a review" do
  it "it adds a new review" do
    visit products_path
    click_link 'Add Product'
    fill_in 'Name', :with => 'Salt'
    fill_in 'Cost', :with => '1.23'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    click_on 'Salt'
    click_on 'Add Review'
    fill_in 'Author', :with => 'Bertilda'
    save_and_open_page
    fill_in 'text_area', :with => 'The best kind of food is the kind that keeps on feeding your mouth and your heart with food'
    fill_in 'Rating', :with => '5'
    click_on 'Create Review'
    expect(page).to have_content 'Bertilda'
  end
end