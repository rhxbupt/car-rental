class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.string :car_id
      t.string :user_id
      t.string :location
      t.string :model
      t.string :manufacturer
      t.string :style
      t.datetime :start
      t.datetime :end
      t.timestamps
    end
  end
end
