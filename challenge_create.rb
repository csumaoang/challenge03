require_relative 'ar.rb'

# Create three new products using the three different ways to create new AR objects.
# Method 1
apple = Product.new
apple.name = "Apple"
apple.description = "Red fruit"
apple.price = "3.00"
apple.stock_quantity = 10
apple.save

# Method 2
banana = Product.new(   name: "Banana", 
                        description: "Yellow fruit",
                        price: "4.00",
                        stock_quantity: 15 )
banana.save

# Method 3
orange = Product.create(    name: "Orange", 
                            description: "Orange fruit",
                            price: "5.00",
                            stock_quantity: 20 )
orange.save

# Ensure all three new products are persisted to the database without validation errors
if apple.valid? && banana.valid? && orange.valid?
    puts "All products were successfully saved to the database."
else
    puts "There was an error saving one or more products to the database."
end

# Create a Product object that is missing some required columns
pear = Product.new(name: "Pear")
pear_saved = pear.save

# Attempt to save this product and print all the AR errors which are generated.
if pear_saved
  puts "Invalid pear product was saved successfully."
else
  puts "Errors occurred while saving the invalid pear product:"
  pear.errors.full_messages.each do |message|
    puts "#{message}"
  end
end