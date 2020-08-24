require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "saves successfully when all required fields are provided" do
      @user = User.new({password: 'ilovecats', password_confirmation: 'ilovecats', email: 'dog@gmail.com', first_name: 'good', last_name: 'boy'})

      @user.save

      expect(@user).to be_present
    end

    it "returns 'First name cannot be blank' if we try to create a User with a nil value in the first name field" do
      @user = User.new({password: 'ilovecats', password_confirmation: 'ilovecats', email: 'dog@gmail.com', first_name: nil, last_name: 'boy'})

      @user.valid?

      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "returns 'Last name cannot be blank' if we try to create a User with a nil value in the last name field" do
      @user = User.new({password: 'ilovecats', password_confirmation: 'ilovecats', email: 'dog@gmail.com', first_name: 'good', last_name: nil})

      @user.valid?

      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "returns 'Email cannot be blank' if we try to create a User with a nil value in the email field" do
      @user = User.new({password: 'ilovecats', password_confirmation: 'ilovecats', email: nil, first_name: 'good', last_name: 'boy'})

      @user.valid?

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "returns 'Password cannot be blank' if we try to create a User with a nil value in the password field" do
      @user = User.new({password: nil, password_confirmation: 'ilovecats', email: 'dog@gmail.com', first_name: 'good', last_name: 'boy'})

      @user.valid?

      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "returns 'Password confirmation cannot be blank' if we try to create a User with a nil value in the password_confirmation field" do
      @user = User.new({password: 'ilovecats', password_confirmation: nil, email: 'dog@gmail.com', first_name: 'good', last_name: 'boy'})

      @user.valid?

      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "returns 'Password is too short (minimum is 5 characters)' if we try to create a User with a password that is less than 5 characters in length" do
      @user = User.new({password: 'cats', password_confirmation: 'cats', email: 'dog@gmail.com', first_name: 'good', last_name: 'boy'})

      @user.valid?

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

    it "returns 'Password confirmation is too short (minimum is 5 characters)' if we try to create a User with a password that is less than 5 characters in length" do
      @user = User.new({password: 'cats', password_confirmation: 'cats', email: 'dog@gmail.com', first_name: 'good', last_name: 'boy'})

      @user.valid?

      expect(@user.errors.full_messages).to include("Password confirmation is too short (minimum is 5 characters)")
    end

    it "returns 'Password confirmation doesn't match Password' if we try to create a User with a password confirmation that differs from the password" do
      @user = User.new({password: 'ilovecats', password_confirmation: 'horses', email: 'dog@gmail.com', first_name: 'good', last_name: 'boy'})

      @user.valid?
      puts "-------"
      puts @user.errors.full_messages

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    
  end

  describe '.authenticate_with_credentials' do
    
  end

end
