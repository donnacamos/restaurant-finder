class RestaurantsController < ApplicationController
    before_action :set_restaurant, only:[:show, :edit, :update] 
    before_action :redirect_if_not_logged_in


    def new 
        @restaurant = Restaurant.new  
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
      @restaurants = Restaurant.order_by_rating.includes(:company)  
    end 

    def show 
    end 

    def edit 
    end 

    def update 
      if @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
      else
        render :edit
      end 
    end 

    private 

    def restaurant_params
        params.require(:restaurant).permit(:name, :price_range, :address, :category_id, category_attributes: [:name])
      end

    def set_restaurant
        @restaurant = Restaurant.find_by(id: params[:id])
        redirect_to restaurants_path if !@restaurant 
     end
end
