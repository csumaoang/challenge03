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

# Updated code
# Find the name of the category associated with one of the products you have found
product = Product.find_by(name: "Tofu")
if product
  category = product.category
  if category
    category_name = category.name
    puts "Category associated with product '#{product.name}': #{category_name}"
  else
    puts "No category associated with product '#{product.name}'."
  end
else
  puts "Product not found."
end

# Find a specific category and use it to build and persist a new product associated with this category
category = Category.find_by(name: "Beverages")
if category
  new_product = category.products.build(name: "Beer", description: "Alcohol", price: 50, stock_quantity: 10)
  if new_product.save
    puts "New product associated with category '#{category.name}' was successfully created and saved."
  else
    puts "Error creating and saving new product."
  end
else
  puts "Category not found."
end

# Find a specific category and then use it to locate all the associated products over a certain price
category = Category.find_by(name: "Produce")
if category
  products_over_price = category.products.where('price > 5')
  if products_over_price.any?
    puts "Products associated with category '#{category.name}' with price over $5.00:"
    products_over_price.each do |product|
      puts "#{product.name}: $#{product.price}"
    end
  else
    puts "No products found associated with category '#{category.name}' over $5.00."
  end
else
  puts "Category not found."
end