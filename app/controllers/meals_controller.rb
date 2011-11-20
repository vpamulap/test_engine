class MealsController < ApplicationController
  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.all
    
    @groceries = consolidate(@meals)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meals }
    end
  end

  def consolidate(meals)
    # Find all unique names
    names = []
    meals.each do |meal|
        meal.recipe.ingredients.each do |ingredient|
             names << ingredient.name
        end
    end
    
    names.uniq!
    
    # Find quantity and recipe_id's for each name
    groceries = []
    names.each do |name|
        quantity = 0
        recipes = []
        
        meals.each do |meal|
            meal.recipe.ingredients.each do |ingredient|
                if ingredient.name == name
                    quantity += ingredient.quantity
                    recipes << ingredient.recipe_id
                end
            end
        end
        
        groceries << { 'quantity' => quantity, 'name' => name, 'recipes' => recipes.join(',') }
    end
    
    logger.info groceries
    
    groceries
end


  # GET /meals/1
  # GET /meals/1.json
  def show
    @meal = Meal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/new
  # GET /meals/new.json
  def new
    @meal = Meal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/1/edit
  def edit
    @meal = Meal.find(params[:id])
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = Meal.new(params[:meal])

    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: 'Meal was successfully created.' }
        format.json { render json: @meal, status: :created, location: @meal }
      else
        format.html { render action: "new" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meals/1
  # PUT /meals/1.json
  def update
    @meal = Meal.find(params[:id])

    respond_to do |format|
      if @meal.update_attributes(params[:meal])
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy

    respond_to do |format|
      format.html { redirect_to meals_url }
      format.json { head :ok }
    end
  end
end
