class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :img_url
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
