class ProductsController < ApplicationController
  skip_before_action :http_basic_authenticate
  
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
