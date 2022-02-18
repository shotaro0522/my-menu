class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
end
