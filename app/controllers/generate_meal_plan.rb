class GenerateMealPlan
  def pick_n_recipes(n)
    @all_recipes = Recipe.all.sample(n)
  end
end
  
  
  