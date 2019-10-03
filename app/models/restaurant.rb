class Restaurant < ApplicationRecord
    belongs_to :user
    belongs_to :company  
    has_many :reviews
    has_many :users, through: :reviews 

    #accepts_nested_attributes_for :company

    validates :name, :type, :price_range, :address, presence: true  
    validates :name, :address, uniqueness: true  
    validates :not_a_duplicate 

    scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

    def self.alpha
        order(:name) 
    end

    def company_attributes=(attributes)
        self.company = Company.find_or_create_by(attributes) if !attributes['name'].empty?
        self.company
    end

    def not_a_duplicate
        # if there is already a restaurant with this name and address 
        restaurant = Restaurant.find_by(name: name, address: address) 
        if !!restaurant && restaurant != self
          errors.add(:name, 'has already been added for that address')
        end
    end 

    def name_and_type
        "#{name} - #{type}"
    end
 
end
