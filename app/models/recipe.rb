class Recipe < ActiveRecord::Base
    belongs_to :chef
    validates :chef_id, presence: true
    validates :name, presence: true, length: {minumum: 5, maximum: 100}
    validates :summarize, presence: true, length: {minumum: 10, maximum: 150}
    validates :description, presence: true, length: {minumum: 20, maximum: 500}
    
end
