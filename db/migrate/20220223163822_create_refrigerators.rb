class CreateRefrigerators < ActiveRecord::Migration[6.0]
  def change
    create_table :refrigerators do |t|
      t.string :stock, null:false
      t.timestamps
    end
  end
end
