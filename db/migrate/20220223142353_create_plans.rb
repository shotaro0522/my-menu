class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.integer    :week_id     , null: false
      t.integer    :recipe_number     , null: false
      t.timestamps
    end
  end
end
