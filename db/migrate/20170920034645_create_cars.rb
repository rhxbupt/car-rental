class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :location
      t.string :model
      t.string :manufacturer
      t.string :style
      t.string :status
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
