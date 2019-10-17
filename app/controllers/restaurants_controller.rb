class RestaurantsController < ApplicationController
    before_action :redirect_if_not_logged_in


    def new 
        @restaurant = Restaurant.new  
        @restaurant.build_category 
    end 

    def create
        @restaurant = Restaurant.new(restaurant_params) 
        @restaurant.user_id = session[:user_id] 
   
       if @restaurant.save 
         redirect_to restaurant_path(@restaurant) 
       else
        @restaurant.build_category  
         render :new
       end
     end

    def index   
      if params[:category_id]
        category = Category.find(params[:category_id])
        @restaurants = category.restaurants 
      
      else 
        @restaurants = Restaurant.order_by_rating.includes(:category) 
      end 
    end 

    def show 
      set_restaurant 
    end 

    def edit 
      set_restaurant
      if authorized_to_edit?(@restaurant) 
       render :edit   
      else 
       redirect_to restaurant_path(@restaurant)   
      end
     end 

    def update 
      set_restaurant   
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

     def redirect_if_not_authorized 
      if @restaurant.update(name: params[:name], price_range: params[:price_range], address: params[:address])   
        redirect_to restaurant_path(@restaurant)
      else
        redirect_to user_path(current_user)     
      end 
    end

end
