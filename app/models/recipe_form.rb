class RecipeForm
  include ActiveModel::Model

  attr_accessor(
    :user_id, :recipe_name, :genre_id, :info, :url, :image,
    :id, :created_at, :datetime, :updated_at, :datetime,
    :ingredient_name
  )
  
  with_options presence: true do
    validates :user_id
    validates :recipe_name
    validates :genre_id
    validates :info
    validates :image
  end

  def save
    recipe = Recipe.create(user_id: user_id, recipe_name: recipe_name, genre_id: genre_id, info: info, url: url, image: image)
    ingredient = Ingredient.where(ingredient_name: ingredient_name).first_or_initialize
    ingredient.save
    RecipeIngredientRelation.create(recipe_id: recipe.id, ingredient_id: ingredient.id)
  end

  def update(params, recipe)
    recipe.update(params)
  end

end