class ReviewsController < ApplicationController
  skip_before_action :http_basic_authenticate
  before_filter :authorize

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to :back
    else
      flash[:notice] = 'Error creating review'
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back, notice: 'Review deleted!'
  end

  private

    def review_params
      params.require(:review).permit(:product_id, :description, :rating)
    end
    def authorize
      unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
    end

end
