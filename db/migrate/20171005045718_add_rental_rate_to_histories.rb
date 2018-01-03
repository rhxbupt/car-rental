class AddRentalRateToHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :rental_rate, :integer
  end
end
