class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :recipe_id
      t.date :completed_date

      t.timestamps
    end
  end
end
