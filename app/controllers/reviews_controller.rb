class ReviewsController < ApplicationController
  before_action :set_bicycle

  def index
  	@reviews = Review.where(bicycle_id: params[:bicycle_id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.bicycle = @bicycle
    @review.user = current_user
    if @review.save
      redirect_to bicycle_review_path(@bicycle, @review)
    else
      render :new
    end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
 # 	redirect_to bicycle_reviews_path(@bicycle)
  	redirect_to bicycles_path
  end

  private

  def set_bicycle
    @bicycle = Bicycle.find(params[:bicycle_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
