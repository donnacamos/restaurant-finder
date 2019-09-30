class Company < ApplicationRecord
    has_many :restaurants 

    validates :name, presence: true, uniqueness: true 
    validates :year_founded, presence: true, length: {minimum: 4} 
    
end
