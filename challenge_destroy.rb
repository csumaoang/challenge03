require_relative 'ar.rb'

# Find one of the products you created in challenge_create.rb
product_being_deleted = Product.find_by(name: "Apple")

# Delete it from the database
if product_being_deleted
  product_being_deleted.destroy
  puts "Product '#{product_being_deleted.name}' was successfully deleted from the database."
else
  puts "Product not found."
end
