class RecipeIngrediant < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingrediant
end