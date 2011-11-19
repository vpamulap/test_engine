class CreateIngredientEntriesTable < ActiveRecord::Migration
    def up
    create_table :ingredient_entries do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :quantity

      t.timestamps
    end
  end

  def down
    drop_table :ingredient_entries
  end
end
