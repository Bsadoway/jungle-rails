class ProductsController < ApplicationController
  skip_before_action :http_basic_authenticate

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where("product_id= ?", params[:id]).reverse_order
    p @reviews
    @users = User.includes(:reviews).distinct
    #@users = User.includes(:reviews).where("user_id= ?", "user_id")
    p @users
  end

end
