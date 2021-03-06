class Recipe < ActiveRecord::Base
    belongs_to :chef
    has_many :likes, dependent: :destroy
    has_many :recipe_styles, dependent: :destroy
    has_many :styles, through: :recipe_styles
    has_many :recipe_ingrediants, dependent: :destroy
    has_many :ingrediants, through: :recipe_ingrediants
    
    validates :chef_id, presence: true
    validates :name, presence: true, length: {minumum: 5, maximum: 100}
    validates :summarize, presence: true, length: {minumum: 10, maximum: 150}
    validates :description, presence: true, length: {minumum: 20, maximum: 500}
    mount_uploader :picture, PictureUploader
    validate :picture_size
    default_scope -> { order(updated_at: :desc) }
    
    def thumbs_up_total
      self.likes.where(like: true).size
    end
    
    def thumbs_down_total
      self.likes.where(like: false).size
    end
    
    private
        def picture_size
            if picture.size > 5.megabytes
                errors.add(:picture, "Should be less than 5MB" )
            end
        end
    
end
