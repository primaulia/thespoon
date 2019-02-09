class ReviewsController < ApplicationController
  def new
    # new reviews
    # pass it to the view
    @restaurant = Restaurant.find(params[:restaurant_id])
    @new_review = Review.new
  end

  def create
    #
    # assign the review to the restaurant
    # create the review using active records
    @restaurant = Restaurant.find(params[:restaurant_id])
    @new_review = Review.new(review_params)
    @new_review.restaurant = @restaurant

    # if @review is valid
    if @new_review.save
      redirect_to restaurant_path(@restaurant) #happy flow
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit([:content])
  end
end
