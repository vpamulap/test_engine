class DropIngredientEntriesTable < ActiveRecord::Migration
  def up
    drop_table :ingredient_entries
  end

  def down
    create_table :ingredient_entries do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :quantity

      t.timestamps
    end
  end
end
