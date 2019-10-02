class Review < ApplicationRecord
    belongs_to :users 
    belongs_to :restaurants 

    validates :title, :content, presence: true 
    validates :title, :content, uniqueness: true 
    validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6} 
end
