class UsersController < ApplicationController
  def show

    @nickname = current_user.nickname

    if Recipe.exists?(user_id: current_user.id)
      @recipes = Recipe.where(user_id: current_user.id).order(created_at: "DESC")
    end

    get_week
    get_ingredients

    @plan = Plan.new

  end

  def get_week
    wdays = ['(月)','(火)','(水)','(木)','(金)','(土)','(日)']

    @week_days = []

    plans = Plan.all

    7.times do |x|

      today_plans = []

      plans.each do |plan|
        if plan.week_id ==  x
          recipename = Recipe.find_by(id: plan.recipe_number)
          today_plans.push(recipename.recipe_name)
        end
      end

      days = {plans: today_plans, wday: wdays[x]}
      @week_days.push(days)

    end
  end

  def get_ingredients

    @ingredients = []

    week_plan = Plan.all

    week_plan.each do |plan|
      relation = RecipeIngredientRelation.find_by(recipe_id: plan.recipe_number)
      ingredient = Ingredient.find_by(id: relation.ingredient_id)
      @ingredients.push(ingredient.ingredient_name)
    end
    
  end




end
