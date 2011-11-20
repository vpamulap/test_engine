class DashboardController < ApplicationController
  def confirm_meals
    # todo: implement logic to save the meals the user selected 
  end

  def recipes
    # todo: choose X random meals and show them in the view
    @recipes = Recipe.all
    respond_to do |format|
      format.html # recipe.html.erb
      format.json { render json: @recipes }
    end
  end
  
  def change_recipe
    # todo: returns a new random recipe template to replace one they rejected.
    # Pick one that is not already shown on the page
    respond_to do |format|
      format.html # recipe.html.erb
      format.json { render json: @recipes }
    end
  end
end
