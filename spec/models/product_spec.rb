require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'is valid when it has all required attributes' do
    category = Category.create(name: "test")
    product = Product.new(name: "Orange Tree", description: "bleh", image:'duh', price_cents:"3000", quantity: 30, category_id: category.id)
    expect(product).to be_valid 
  end

  it 'is invalid when it does not have name' do
    category = Category.create(name: "test")
    product = Product.new(description: "bleh", image:'duh', price_cents:"3000", quantity: 30, category_id: category.id)
    expect(product).not_to be_valid 
  end

  it 'is invalid when it does not have price' do
    category = Category.create(name: "test")
    product = Product.new(name: "Orange Tree", description: "bleh", image:'duh', quantity: 30, category_id: category.id)
    expect(product).not_to be_valid 
  end

  it 'is invalid when it does not have quantity' do
    category = Category.create(name: "test")
    product = Product.new(name: "Orange Tree", description: "bleh", image:'duh', price_cents:"3000", category_id: category.id)
    expect(product).not_to be_valid 
  end

  it 'is invalid when it does not have category' do
    category = Category.create(name: "test")
    product = Product.new(name: "Orange Tree", description: "bleh", image:'duh', price_cents:"3000", quantity: 30)
    expect(product).not_to be_valid 
  end



  
end