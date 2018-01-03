class AddRentalRateToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :rental_rate, :integer
  end
end
