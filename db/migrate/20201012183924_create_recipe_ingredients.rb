class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.belongs_to :recipe, null: false
      t.belongs_to :ingredient, null: false

      t.timestamps
    end
  end
end
