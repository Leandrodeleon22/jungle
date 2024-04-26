require 'rails_helper'


RSpec.describe Product, type: :model do
    describe 'Validations' do
      # validation tests/examples here
      
      it "is valid" do
        @product = Product.new
        @category = Category.new
        @category.name = 'Test'
        @product.name = 'Test'
        @product.price_cents = 1234
        @product.quantity = 3
        @product.category = @category
        expect(@product.valid?).to be true
      
      end

      it "name presence" do
        @product = Product.new
        @product.name = nil
        @product.valid?
        expect(@product.errors[:name]).to  include("can't be blank")
    
        @product.name = 'test'
        @product.valid? 
        expect(@product.errors[:name]).not_to  include("can't be blank")
      end


      it "price_cents presence" do
        @product = Product.new
        @product.price_cents = nil
        @product.valid?
        expect(@product.errors[:price_cents]).to  include("is not a number")
    
        @product.price_cents = 12311 
        @product.valid? 
        expect(@product.errors[:price_cents]).not_to  include("can't be blank")
      end

      it "quantity" do
        @product = Product.new
        @product.quantity = nil 
        @product.valid?
        expect(@product.errors[:quantity]).to  include("can't be blank")
    
        @product.quantity = 3
        @product.valid? 
        expect(@product.errors[:quantity]).not_to  include("can't be blank")
      end

      it "has category_id" do
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