# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
user1 = User.create(username: "Donna", email: "donna@donna.com", password: "password" ) 
category1 = Category.create(name: "Mexican") 
restaurant1 = Restaurant.create(name: "San Joe's Mexican Grill", price_range: "$$", address: "460 S Main St, Dawson, GA 39842", user_id: user1.id, category_id: category1.id)
review1 = Review.create(stars: "4", title: "Great Food!", content: "Would 100% recommend!", restaurant_id: restaurant1.id, user_id: user1.id) 