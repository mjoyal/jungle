require 'rails_helper'


RSpec.describe User, type: :model do
  
  let(:user) { User.new(
    first_name: 'Jane',
    last_name: 'Doe',
    email: 'jdoe@test.com',
    password: '123456',
    password_confirmation: '123456'
  )}
  
 
  describe 'Validations' do 
    
    context "All fields are valid" do
      it "creates a new user" do
        expect{user.save}.to change{User.count}.by(1)
      end
    end

    context "Missing fields" do
      it "returns error if passworld is nil" do
        user.password = nil
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to eq ["Password can't be blank"]
      end

      it "returns error if email is nil" do
        user.email = nil
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to eq ["Email can't be blank"]
      end

      it "return error if first name is nil" do
        user.first_name = nil
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to eq ["First name can't be blank"]
      end

      it "returns error if last name is nil" do
        user.last_name = nil
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to eq ["Last name can't be blank"]
      end

    end
    
    context 'Invalid Fields' do 
      it 'returns error if password and password confirmation do not match' do
        user.password_confirmation = 'nope'
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to eq ["Password confirmation doesn't match Password"]
      end

      it "returns error if password is under 6 characters" do
        user.password = '123'
        user.password_confirmation = '123'
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to eq ["Password is too short (minimum is 6 characters)"]
      end
      
      
    end

 

  end
end
