class RecipesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
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

  private
  def recipe_form_params
    params.require(:recipe_form).permit(:recipe_name, :genre_id, :info, :url, :image).merge(user_id: current_user.id)
  end

  
end
