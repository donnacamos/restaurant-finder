class RestaurantsController < ApplicationController
    def new 
        @restaurant = Restaurant.new 
       # @restaurant.companies.build 
    end 

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.user_id = session[:user_id]
   
       if @restaurant.save #this is where validations happen
         redirect_to restaurant_path(@restaurant) 
       else
         @restaurant.build_company
         render :new
       end
     end

     def index 
       @restaurants = Restaurant.all 
     end 

    def show 
    end 

    private 

    def restaurant_params
        params.require(:restaurant).permit(:name, :type, :price_range, :address, :company_id, company_attributes: [:name])
      end
end
