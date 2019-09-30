class User < ApplicationRecord
    has_many :restaurants
    has_many :reviews through: :restaurants 
    has_secure_password 
end
