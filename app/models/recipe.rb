class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image
  has_many :recipe_ingredient_relation
  has_many :ingredients, through: :recipe_ingredient_relations

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
end
