class AddQuantityAndUnitToIngredientTable < ActiveRecord::Migration
  def change
    add_column :ingredients, :unit, :string
    add_column :ingredients, :quantity, :integer
  end
end
