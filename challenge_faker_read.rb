require_relative 'ar.rb'

# Find all categories in the database
categories = Category.all

# Display all category names and their associated products (name and price)
categories.each do |category|
  puts "#{category.name}:"
  category.products.each do |product|
    puts "- #{product.name}: $#{product.price}"
  end
  puts "-------------------------"
end
