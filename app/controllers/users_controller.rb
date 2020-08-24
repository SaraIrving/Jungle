class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  #  Create an instance method authenticat_with_credentials
  def self.authenticate_with_credentials(params[:email], params[:password])

    # see if there is a user in the database with the given email
    user = User.find_by_email(params(:email_address)

    # If the user exists AND the password provided is correct then return and instance of that user, if not return nil

    if user && user.authenticate(params(:password)
      return user
    else
      nil
    end

  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
