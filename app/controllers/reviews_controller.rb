class ReviewsController < ApplicationController
  before_action :set_bicycle

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.bicycle = @bicycle
    if @review.save
      redirect_to bicycle_review_path([@bicycle, @review])
    else
      render :new
    end
  end

  private

  def set_bicycle
    @bicycle = Bicycle.find(params[:bicycle_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
