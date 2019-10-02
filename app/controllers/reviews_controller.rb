class ReviewsController < ApplicationController
    def new 
        Restaurant.find_by_id(params[":restaurant_id"]) 
        @review = @restaurant.reviews.build
    end 

    def create
      @review = Review.create(review_params) 
      if @review.save
      redirect_to review_path(@review) 
    end 

    def show 
      @review.restaurant
    end 

    def index
    end 

    def review_params
        params.require(review)permit(:stars, :title, :content, :restaurant_id) 
    end 
end
