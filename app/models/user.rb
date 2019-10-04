class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_restaurants, through: :reviews, source: :restaurant 

    has_many :restaurants  

    has_secure_password 

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true 

    def self.create_by_google_omniauth(auth)
      where(email: auth.info.email).first_or_initialize do |user|
        user.username = auth.info.name
        user.email = auth.info.email
        user.password = SecureRandom.hex
      end
    end
end
