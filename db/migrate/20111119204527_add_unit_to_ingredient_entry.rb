class AddUnitToIngredientEntry < ActiveRecord::Migration
  def change
    add_column :ingredient_entries, :unit, :string
  end
end
