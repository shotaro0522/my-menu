class RecipesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_recipe, only: [:edit, :update, :show]

  def index
    @recipes = Recipe.order(created_at: "DESC")
  end

  def new
    @recipe_form = RecipeForm.new
  end

  def create
    @recipe_form = RecipeForm.new(recipe_form_params)
    if @recipe_form.valid?
      @recipe_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    if RecipeIngredientRelation.exists?(recipe_id: @recipe.id)
      relation = RecipeIngredientRelation.find_by(recipe_id: @recipe.id)
      ingredient1 = Ingredient.find_by(id: relation.ingredient_id)
      @ingredient1 = ingredient1.ingredient_name
    end
  end

  def edit
    recipe_attributes = @recipe.attributes
    @recipe_form = RecipeForm.new(recipe_attributes)
    # @recipe_form.ingredient_name = @recipe.ingredients&.first&.ingredient_name
  end

  def update
    @recipe_form = RecipeForm.new(recipe_form_params)
    @recipe_form.image ||= @recipe.image.blob
    if @recipe_form.valid?
      @recipe_form.update(recipe_form_params, @recipe)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def recipe_form_params
    params.require(:recipe_form).permit(:recipe_name, :genre_id, :info, :url, :ingredient_name, :image).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  
end
