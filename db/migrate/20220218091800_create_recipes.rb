class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :user,    null: false, foreign_key: true
      t.string :recipe_name, null: false
      t.integer    :genre_id     , null: false
      t.text :info, null: false
      t.string :url
      t.timestamps
    end
  end
end
