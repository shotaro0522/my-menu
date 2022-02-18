class RecipeForm
  include ActiveModel::Model

  attr_accessor(
    :user_id, :recipe_name, :genre_id, :info, :url, :image,
    :id, :created_at, :datetime, :updated_at, :datetime
  )
  
  with_options presence: true do
    validates :user_id
    validates :recipe_name
    validates :genre_id
    validates :info
    validates :image
  end

  def save
    Recipe.create(user_id: user_id, recipe_name: recipe_name, genre_id: genre_id, info: info, url: url, image: image)
  end

  def update(params, recipe)
    recipe.update(params)
  end

end