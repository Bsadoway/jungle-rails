class CategoriesController < ApplicationController
  skip_before_action :http_basic_authenticate

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
