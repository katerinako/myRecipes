class RecipeIngrediants < ActiveRecord::Migration
  def change
    create_table :recipe_ingrediants do |t|
      t.integer :ingrediant_id
      t.integer :recipe_id
    end
  end
end
