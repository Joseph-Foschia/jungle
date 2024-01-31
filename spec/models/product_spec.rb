require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # Set up a category and product before each example
    before(:each) do
      @category = Category.new(name: 'Test Category')
      @product = Product.new(
        name: 'Test Product',
        price: 100,
        quantity: 10,
        category: @category
      )
    end

    it 'saves successfully when all fields are valid' do
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Sorry but your name can't be blank")
    end

    it 'is not valid without a price' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("The price can't be blank :/")
    end

    it 'is not valid without a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("THE QUANTITY CANNOT BE BLANK")
    end

    it 'is not valid without a category' do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
