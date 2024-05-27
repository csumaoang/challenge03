require_relative 'ar.rb'

# Generate 10 new categories and 10 new products for each category using Faker
10.times do
  category = Category.create(name: Faker::Commerce.department)
  if category.valid?
    10.times do
      product = category.products.create(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.sentence,
        price: Faker::Commerce.price(range: 0..100.0, as_string: false),
        stock_quantity: Faker::Number.between(from: 0, to: 100)
      )
      puts "Product '#{product.name}' created for category '#{category.name}'."
    end
  else
    puts "Error creating category."
  end
end
