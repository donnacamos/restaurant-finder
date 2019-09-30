class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews 

    validates :name, :type, :price_range, :address, presence: true  
    validates :name, :address, uniqueness: true  
    validates :name, length: { minimum: 3} 
end
