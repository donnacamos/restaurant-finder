class Review < ApplicationRecord
    belongs_to :users 
    belongs_to :restaurants 

    validates :rating, :title, :content, presence: true 
    validates :title, :content, uniqueness: true 
    validates :rating, numericality: { less_than_or_equal_to: 10, greater_than: 0, only_integer: true}
end
