class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_restaurants, through: :reviews, source: :restaurant 

    has_many :restaurants   

    has_secure_password 

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true 

    def self.create_by_github_omniauth(auth)
      self.find_or_create_by(username: auth[:info][:email]) do |u|
        u.email = auth[:info][:email]  
        u.password = SecureRandom.hex
  
      end
    end
end
