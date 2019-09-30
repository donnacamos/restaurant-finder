class User < ApplicationRecord
    has_many :restaurants
    has_many :reviews, through: :restaurants 
    has_secure_password 
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true 
end
