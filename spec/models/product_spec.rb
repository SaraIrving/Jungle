require 'rails_helper'
require 'Product'
require 'Category'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # write the Product validation tests/examples here 
    it "saves successfully when all four required fields are provided" do
      @category = Category.new(name: 'cars')

      @product = Product.new({name: "Batmobile", category: @category, quantity: 2, price: 1000})

      @product.valid?

      expect(@product.errors.full_messages).to eq([])
    end

    it "returns 'Name cannot be blank' if we try to create a Product with a nil value in the name field" do
      @category = Category.new(name: 'cars')

      @product = Product.new({name: nil, category: @category, quantity: 2, price: 1000})

      @product.valid?

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "returns 'price cannot be blank' if we try to create a Product with a nil value in the price field" do
      @category = Category.new(name: 'cars')

      @product = Product.new({name: "Batmobile", category: @category, quantity: 2, price: nil})

      @product.valid?

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "returns 'quantity cannot be blank' if we try to create a Product with a nil value in the quantity field" do
      @category = Category.new(name: 'cars')

      @product = Product.new({name: "Batmobile", category: @category, quantity: nil, price: 10000})

      @product.valid?

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "returns 'Category cannot be blank' if we try to create a Product with a nil value in the category field" do

      @product = Product.new({name: "Batmobile", category: nil, quantity: 2, price: 10000})

      @product.valid?

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  
  end
end
