class Ingredient < ApplicationRecord
  has_many :recipe_ingredient_relations
  has_many :recipes, through: :recipe_ingredient_relations
  validates :ingredient_name,  uniqueness: true
end
