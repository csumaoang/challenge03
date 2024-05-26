class Product < ActiveRecord::Base
  # This AR object is linked with the products table.
  
  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  belongs_to :category

  # Columns in the products table are: id, name, description, price, stock_quantity, category_id, created_at, and updated_at
  # Based on the columns found, the category table has an association with the products table because of category_id
end