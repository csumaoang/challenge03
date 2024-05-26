require_relative 'ar.rb'

# Total number of products
number_of_products = Product.count
puts "There are #{number_of_products} in the products table."

# The names of all products above $10 with names that begin with the letter C.
products_above_10_with_c_names = Product.where('price > 10 AND name LIKE "C%"')
puts "Products above $10 with names that begin with the letter C:"
products_above_10_with_c_names.each do |product|
  puts "#{product.name}"
end

# Total number of products with a low stock quantity. (Low is defined as less than 5 in stock.)
products_low_stock = Product.where('stock_quantity < 5').count
puts "Total number of products with low stock quantity: #{products_low_stock}"