class ReviewsController < ApplicationController
  skip_before_action :http_basic_authenticate
  before_action :user_signed_in?

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

end
