require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do 
    
    context "All fields are valid" do
      it('should save when all rows are valid') do
        @category = Category.new(name: "apparel")
        @category.save!
        @product = Product.new(name: "glasses", description: "see with these", price_cents: 500, category_id: @category.id, quantity: 50)
        expect{@product.save!}.to change{Product.count}.by(1)
      end
    end

    context "Missing fields" do
      it "is not valid without a name" do
        @category = Category.new(id: 1, name: "apparel")
        @category.save
        @product = Product.new(name: nil, quantity: 50, price_cents: 500, category_id: @category.id)
        expect(@product).to_not be_valid
      end
  
      it "is not valid without a price" do
        @category = Category.new(id: 1, name: "apparel")
        @category.save
        @product = Product.new(name: "mackenzie", quantity: 50, price_cents: nil, category_id: @category.id)
        expect(@product).to_not be_valid
      end
  
      it "is not valid without a quantity" do
        @category = Category.new(id: 1, name: "apparel")
        @category.save
        @product = Product.new(name: "mackenzie", quantity: nil, price_cents: 500, category_id: @category.id)
        expect(@product).to_not be_valid
      end
  
      it "is not valid without a category" do
        @product = Product.new(name: "mackenzie", quantity: nil, price_cents: 500, category_id: nil)
        expect(@product).to_not be_valid
      end
  
    end
  end
end
