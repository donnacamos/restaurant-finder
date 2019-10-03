class RestaurantsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        @restaurants = Restaurant.order_by_rating.includes(:company)  
    end 

    def new 
        @restaurant = Restaurant.new 
       # @restaurant.companies.build 
    end 

    def create
        @restaurant = Restaurant.new(restaurant_params) 
   
       if @restaurant.save #this is where validations happen
         redirect_to restaurant_path(@restaurant) 
       else
         render :new
       end
     end


    def show 
    end 

    private 

    def restaurant_params
        params.require(:restaurant).permit(:name, :type, :price_range, :address, :company_id, company_attributes: [:name])
      end

    def set_restaurant
        @restaurant = Restaurant.find_by(id: params[:id])
        redirect_to restaurants_path if !@restaurant 
     end
end
