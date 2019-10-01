class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_restaurants, through: :reviews, source: :restaurant 
    has_many :restaurants  
    has_secure_password 
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true 

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
          u.password = SecureRandom.hex
        end
      end
end
