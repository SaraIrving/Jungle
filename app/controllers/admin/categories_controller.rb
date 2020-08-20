class Admin::CategoriesController < ApplicationController

  admin_name = ENV['HTTP_BASIC_USER']
  admin_password = ENV['HTTP_BASIC_PASSWORD']

  http_basic_authenticate_with name: admin_name, password: admin_password


  
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end


end
