class Recipe < ActiveRecord::Base
    belongs_to :chef
    validates :chef_id, presence: true
    validates :name, presence: true, length: {minumum: 5, maximum: 100}
    validates :summarize, presence: true, length: {minumum: 10, maximum: 150}
    validates :description, presence: true, length: {minumum: 20, maximum: 500}
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    private
        def picture_size
            if picture.size > 5.megabytes
                errors.add(:picture, "Should be less than 5MB" )
            end
        end
    
end
