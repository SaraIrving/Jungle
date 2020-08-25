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

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    
  end

  describe '.authenticate_with_credentials' do
    #create a user and then test if they can login
    it "returns an instance of the user model if an existing user tries to login with the correct email and password" do
      @user = User.new({password: 'ilovecats', password_confirmation: 'ilovecats', email: 'dog@gmail.com', first_name: 'good', last_name: 'boy'})

      @user.save

      expect(User.authenticate_with_credentials('dog@gmail.com', 'ilovecats' )).to eq(@user)
    end

    it "returns nil if an existing user tries to login with the correct email and incorrect password" do
      @user = User.new({password: 'ilovecats', password_confirmation: 'ilovecats', email: 'dog@gmail.com', first_name: 'good', last_name: 'boy'})

      @user.save

      expect(User.authenticate_with_credentials('dog@gmail.com', 'woofwoof' )).to be nil
    end

    it "returns nil if user attempts to login with an email that is not in the database " do
      @user = User.new({password: 'ilovecats', password_confirmation: 'ilovecats', email: 'dog@gmail.com', first_name: 'good', last_name: 'boy'})

      @user.save

      expect(User.authenticate_with_credentials('dog_hater@gmail.com', 'woofwoof' )).to be nil
    end

    it "returns an instance of the user model if an existing user tries to login with the correct email(with inconsistences in the case of the characters) and password" do
      @user = User.new({password: 'ilovecats', password_confirmation: 'ilovecats', email: 'dog@gmail.com', first_name: 'good', last_name: 'boy'})

      @user.save

      expect(User.authenticate_with_credentials('DoG@gmail.com', 'ilovecats' )).to eq(@user)
    end


    it "returns an instance of the user model if an existing user tries to login with the correct email(with some extra whitespace characters added to the start of the input) and correct password" do
      @user = User.new({password: 'ilovecats', password_confirmation: 'ilovecats', email: 'dog@gmail.com', first_name: 'good', last_name: 'boy'})

      @user.save

      expect(User.authenticate_with_credentials('  dog@gmail.com', 'ilovecats' )).to eq(@user)
    end
    
  end

end
