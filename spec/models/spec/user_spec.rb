require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'Validations' do 
    
    # it "must be created with a password" do
    #   @user = User.new(first_name: "MacKenzie", last_name: "Joyal", email: "email@email.com", password: nil, password_confirmation: 'hello')
    #   expect(@user).to_not be_valid
    # end


    # it "must not create a new user when password and password_confirmation aren't the same" do
    #   @user = User.new(first_name: "MacKenzie", last_name: "Joyal", email: "email@email.com", password: 'hi', password_confirmation: 'hello')
    #   expect{@user.save}.to change{User.count}.by(0)
    # end

    it "must not create a new user when password and password_confirmation aren't the same" do
      # @user = User.new(first_name: "MacKenzie", last_name: "Joyal", email: "EMAIL@email.com", password: 'hello', password_confirmation: 'hello')
      # @user.save!
      # puts @user.inspect

      # @category = Category.new(id: 1, name: "apparel")
      # @category.save

      # @product = Product.new(name: "glasses", description: "see with these", price_cents: 500, category_id: 1, quantity: 50)
      # @product.save!

      # puts Product.first.inspect
      # @user2 = User.new(first_name: "MacKenzie", last_name: "Joyal", email: "EMAIL@email.com", password: 'hi', password_confirmation: 'hello')

      # expect{@user.save}.to change{User.count}.by(0)
    end





  end
end
