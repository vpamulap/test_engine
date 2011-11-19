class Recipe < ActiveRecord::Base
   has_many :ingredient_entries
   has_many :meals
end
