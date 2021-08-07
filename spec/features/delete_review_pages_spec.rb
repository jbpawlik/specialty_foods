require 'rails_helper'

describe "editing a review" do
  it "it edits a review" do
    visit products_path
    click_link 'Add Product'
    fill_in 'Name', :with => 'Salt'
    fill_in 'Cost', :with => '1.23'
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    click_on 'Salt'
    click_on 'Add Review'
    fill_in 'Author', :with => 'Bertilda'
    fill_in 'text_area', :with => 'The best kind of food is the kind that keeps on feeding your mouth and your heart with food'
    fill_in 'Rating', :with => '5'
    click_on 'Create Review'
    click_on 'Bertilda'
    click_on 'Edit review'
    fill_in 'Author', :with => 'Bartumba'
    click_on 'Update Review'
    expect(page).to have_content('Bartumba')
  end
end