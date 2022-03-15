require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is a product that is valid" do
      @product = Product.new
      @cat = Category.new
      @cat.name = 'test'
      @product.name = 'test' 
      @product.price_cents = 12345
      @product.quantity = 5
      @product.category = @cat
      expect(@product.valid?).to be true
    end
    it "is a product that has a name" do
      @product = Product.new
      @product.name = nil
      @product.valid?
      expect(@product.errors[:name]).to  include("can't be blank")

      @product.name = 'test'
      @product.valid? 
      expect(@product.errors[:name]).not_to  include("can't be blank")
    end
    it "is a product that has price_cents" do
      @product = Product.new
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors[:price_cents]).to  include("is not a number")

      @product.price_cents = 12345
      @product.valid? 
      expect(@product.errors[:price_cents]).not_to  include("can't be blank")
    end
    it "is a product that has quantity" do
      @product = Product.new
      @product.quantity = nil
      @product.valid?
      expect(@product.errors[:quantity]).to  include("can't be blank")

      @product.quantity = 3
      @product.valid? 
      expect(@product.errors[:quantity]).not_to  include("can't be blank")
    end

    it "is a product that has category_id" do
      @cat = Category.new
      @product = Product.new
      @product.category = nil
      @product.valid?
      expect(@product.errors[:category]).to  include("can't be blank")

      @product.category = @cat
      @product.valid? 
      expect(@product.errors[:category]).not_to  include("can't be blank")
    end
  end
end
