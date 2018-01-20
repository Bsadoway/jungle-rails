class ProductsController < ApplicationController
  skip_before_action :http_basic_authenticate

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where("product_id= ?", params[:id]).reverse_order
    @users = User.includes(:reviews).distinct
  end

end
