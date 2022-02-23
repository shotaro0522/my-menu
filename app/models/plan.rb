class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :week

  validates :recipe_number, presence: true
  validates :week_id, presence: true


end
