class CreateUserAllergies < ActiveRecord::Migration[6.0]
  def change
    create_table :user_allergies do |t|
      t.belongs_to :user, null: false
      t.belongs_to :ingredient, null: false
      t.string :severity

      t.timestamps
    end
  end
end
