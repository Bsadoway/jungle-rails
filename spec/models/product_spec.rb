require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid with all properties filled in' do
      category = Category.create(name: "food")
      product = Product.create(name: "Burger", price: 20.00, quantity: 45, category: category)
      expect(product).to be_valid
    end
    it 'should be invalid with no name' do
      category = Category.new(name: "food")
      product = Product.new(name: nil, price: 20.00, quantity: 45, category: category)
      expect(product).to_not be_valid
      expect(product.errors[:name]).to(include("can't be blank"))
    end
    it 'should be invalid with no price' do
      category = Category.new(name: "food")
      product = Product.new(name: "Burger", price: nil, quantity: 45, category: category)
      expect(product).to_not be_valid
      expect(product.errors[:price]).to(include("can't be blank"))
      expect(product.errors[:price]).to(include("is not a number"))
    end
    it 'should be invalid with no quantity' do
      category = Category.new(name: "food")
      product = Product.new(name: "Burger", price: 20.00, quantity: nil, category: category)
      expect(product).to_not be_valid
      expect(product.errors[:quantity]).to(include("can't be blank"))
    end
    it 'should be invalid with no category' do
      product = Product.new(name: 'Burger Barn', price: 20.00, quantity: 45, category: nil)
      expect(product).to_not be_valid
      expect(product.errors[:category]).to(include("can't be blank"))
    end
  end
end
