# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Product.connection.execute("truncate table products, reviews")

Product.destroy_all
Review.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Product.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Review.table_name)


50.times do |index|
  Product.create!(name: Faker::Food.ingredient, cost: Faker::Commerce.price, country_of_origin: Faker::Address.country ) 
end

250.times do |index|
Review.create!(author: Faker::Name.name, rating: Faker::Number.rand(1..5), content_body: Faker::Hipster.words(number: 10..20).join(" "), product_id: Faker::Number.rand(1..50))
end


p "Created #{Product.count} products and #{Review.count} reviews"