class Admin::DashboardController < ApplicationController

  admin_name = ENV['HTTP_BASIC_USER']
  admin_password = ENV['HTTP_BASIC_PASSWORD']

  http_basic_authenticate_with name: admin_name, password: admin_password


  
  def show
    @products_count = Product.count
    @categories_count = Category.count 
  end

end
