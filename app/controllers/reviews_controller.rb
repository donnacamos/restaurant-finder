class ReviewsController < ApplicationController
    def new 
        Restaurant.find_by_id(params[:id]) 
        @review = @restaurant.build_review 
    end 

    def index
    end 
end
