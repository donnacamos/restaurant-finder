class Restaurant < ApplicationRecord
    belongs_to :users
    belongs_to :companies 
    has_many :reviews
    has_many :users, through: :reviews 

    #accepts_nested_attributes_for :company

    validates :name, :type, :price_range, :address, presence: true  
    validates :name, :address, uniqueness: true  
    validates :name, length: { minimum: 3} 
 
end
