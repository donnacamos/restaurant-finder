class ReviewsController < ApplicationController
    def new 
        Restaurant.find_by_id(params[":restaurant_id"]) 
        @review = @restaurant.reviews.build
    end 

    def index
    end 
end
